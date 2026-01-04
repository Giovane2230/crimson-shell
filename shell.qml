import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
    implicitHeight: 30
    color: "#1e1e2e"

  Text {
    anchors.centerIn: parent
    text: "hello mario."
    color: "#cdd6f4"
  }
}