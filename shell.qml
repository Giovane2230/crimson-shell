import Quickshell
import Quickshell.Wayland
import QtQuick
import "components/bar"
import "components/bar/widgets"

ShellRoot {
    Bar {
        bar_color: "#000000"
        size: 50
        margin: 40
        padding: 0
        position: Bar.Position.Right
        left:Text {
            text: "Olamigo"
            color: "#00ff00"
        }
        center:Text {
            text: "Ola jamaica"
            color: "#ff0000"
        }
        right:Text {
            text: "Xamã"
            color: "#0000ff"
        }

    }
}
