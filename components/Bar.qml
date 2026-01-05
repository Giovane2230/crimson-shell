import QtQuick
import Quickshell

PanelWindow {
    id: bar
    enum Position {
        Top = 0,
        Bottom = 1,
        Left = 2,
        Right = 3
    }
    property int position: Bar.Position.Top
    Component.onCompleted: {
            console.log("=== Bar Debug ===")
            console.log("Position:", position)
            console.log("Width:", width)
            console.log("Height:", height)
            console.log("Anchors top:", anchors.top)
            console.log("Anchors left:", anchors.left)
    }
    anchors {
        top: position !== Bar.Position.Bottom
        bottom: position !== Bar.Position.Top
        left:position !== Bar.Position.Right
        right: position !== Bar.Position.Left
    }
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
