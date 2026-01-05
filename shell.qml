import Quickshell
import Quickshell.Wayland
import QtQuick
import "components/bar"

ShellRoot {
    Bar {
        bar_color: "#ff00ff"
        size: 40
        position: Bar.Position.Left
        Text {
            text: "Olamigo"
        }
        Text {
            text: "Ola jamaica"
            color: "#ff0000"
        }
    }
}
