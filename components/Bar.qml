import QtQuick
import Quickshell

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
    
    property int position: Bar.Position.Top
    property int size: 22
    //when this is TOP or BOTTOM, the width must be 100%, so we ignore it, this is just modificated when on the X axis
    width: position === Bar.Position.Top || position === Bar.Position.Right ? size : undefined
    //same logic as above, but applied to Y axis
    height: position === Bar.Position.Right || position === Bar.Position.Left ? size : undefined 
        
    
    Rectangle {
        anchors.fill: parent
        color: "#1a1a1a"
         
        Text {
            text: "Crimson Shell"
            color: "#ff0000"
            anchors.centerIn: parent
        }
    }
}
