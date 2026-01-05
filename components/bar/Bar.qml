import QtQuick
import Quickshell
import QtQuick.Layouts

PanelWindow {
    enum Position {
        Top = 0,
        Bottom = 1,
        Left = 2,
        Right = 3
    }
    id: bar
     
    anchors {
        top: position !== Bar.Position.Bottom
        bottom: position !== Bar.Position.Top
        left:position !== Bar.Position.Right
        right: position !== Bar.Position.Left
    }
    
    property alias left: leftSlot.children
    property alias center: centerSlot.children
    property alias right: rightSlot.children
    property int position: Bar.Position.Top
    property int size
    property string bar_color
    property bool is_horizontal: position === Bar.Position.Top || position === Bar.Position.Bottom
    property bool is_vertical: !is_horizontal    
    //when this is TOP or BOTTOM, the width must be 100%, so we ignore it, this is just modificated when on the X axis
    implicitWidth: is_vertical ? size : undefined
    //same logic as above, but applied to Y axis
    implicitHeight: is_horizontal ? size : undefined 
        
    RowLayout {
        
        Rectangle {
            color: bar_color
            anchors.fill: parent
        }
        anchors.fill: parent
        
        RowLayout {
            id: leftSlot
            anchors.leftMargin: 10
        }
        Item { Layout.fillWidth: true }
        RowLayout {
            id: centerSlot
        }
        Item { Layout.fillWidth: true }
        RowLayout { 
            id: rightSlot
            anchors.rightMargin: 10
        }
    }
    
    
}
