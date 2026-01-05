import Quickshell
import Quickshell.Wayland
import QtQuick
import "components/bar"
import "components/bar/widgets"

ShellRoot {
    Bar {
        bar_color: "#000000"
        size: 40
        position: Bar.Position.Top
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
