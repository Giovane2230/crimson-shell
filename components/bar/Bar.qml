import QtQuick
import Quickshell
import QtQuick.Layouts

PanelWindow {
    color: "transparent"
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
    
    property alias left: leftLoader.children
    property alias center: centerLoader.children
    property alias right: rightLoader.children
    property int padding 
    property int margin
    property int position: Bar.Position.Top
    property int size
    property string bar_color
    property bool is_horizontal: position === Bar.Position.Top || position === Bar.Position.Bottom
    property bool is_vertical: !is_horizontal    
    //when this is TOP or BOTTOM, the width must be 100%, so we ignore it, this is just modificated when on the X axis
    implicitWidth: is_vertical ? size : -1
    //same logic as above, but applied to Y axis
    implicitHeight: is_horizontal ? size : -1 
        
    Rectangle {
        anchors.fill: parent
        color: bar_color
    }
    GridLayout {
            anchors.fill: parent
            columns: is_horizontal ? 5 : 1
            rows: is_vertical ? 5 : 1
                
            // Slot Esquerda/Topo
            Loader {
                id: leftLoader
                sourceComponent: bar.left
                Layout.alignment: is_horizontal ? Qt.AlignLeft : Qt.AligntTop
            }
    
            // Espaçador 1 (A "Mola")
            Item {
                Layout.fillWidth: isHorizontal
                Layout.fillHeight: !isHorizontal
            }
    
            // Slot Centro
            Loader {
                id: centerLoader
                sourceComponent: bar.center
                Layout.alignment: is_vertical ? Qt.AlignLeft : Qt.AlignCenter
            }
    
            // Espaçador 2 (A "Mola")
            Item {
                Layout.fillWidth: isHorizontal
                Layout.fillHeight: !isHorizontal
            }
    
            // Slot Direita/Baixo
            Loader {
                id: rightLoader
                sourceComponent: bar.right
                Layout.alignment: is_vertical ? Qt.AlignTop : Qt.AlignCenter
            }
        }
}
