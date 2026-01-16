import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pipewire

Scope {
    id: root

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    property bool shouldShowOsd: false
    property real currentVolume: Math.max(0, Pipewire.defaultAudioSink?.audio?.volume ?? 0)
    property bool isMuted: Pipewire.defaultAudioSink?.audio?.muted ?? false

    Connections {
        target: Pipewire.defaultAudioSink?.audio
        function onVolumeChanged() { root.restartTimer(); }
        function onMutedChanged() { root.restartTimer(); }
    }

    function restartTimer() {
        root.shouldShowOsd = true;
        hideTimer.restart();
    }

    Timer {
        id: hideTimer
        interval: 2000
        onTriggered: root.shouldShowOsd = false
    }

    function getVolumeIconPath() {
        if (root.isMuted) return Quickshell.iconPath("audio-volume-muted-symbolic") || Quickshell.iconPath("audio-volume-off");
        if (root.currentVolume < 0.33) return Quickshell.iconPath("audio-volume-low-symbolic") || Quickshell.iconPath("audio-volume-low");
        if (root.currentVolume < 0.66) return Quickshell.iconPath("audio-volume-medium-symbolic") || Quickshell.iconPath("audio-volume-medium");
        return Quickshell.iconPath("audio-volume-high-symbolic") || Quickshell.iconPath("audio-volume-high");
    }

    TextMetrics {
        id: metricsPercent
        font: volumeText.font
        text: "100%"
    }

    TextMetrics {
        id: metricsMute
        font: volumeText.font
        text: "MUTE"
    }

    PanelWindow {
        id: osdWindow
        anchors { bottom: true; left: true; right: true }
        height: 100

        WlrLayershell.layer: WlrLayershell.Layer.Overlay
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        visible: true

        Rectangle {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 50

            width: 350
            height: 50
            radius: 0
            
            color: "#1E2528"
            border.color: "#262F33"
            border.width: 1

            opacity: root.shouldShowOsd ? 1.0 : 0.0
            Behavior on opacity { NumberAnimation { duration: 200 } }

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                spacing: 15

                Image {
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                    Layout.alignment: Qt.AlignVCenter
                    source: root.getVolumeIconPath()
                    fillMode: Image.PreserveAspectFit
                    opacity: root.isMuted ? 0.5 : 1.0
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    height: 6
                    radius: 0
                    color: "#171C1F"

                    Rectangle {
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        
                        width: parent.width * Math.min(1.0, root.currentVolume)
                        radius: 0
                        color: root.isMuted ? "#F57F82" : "#CBE3B3"
                        visible: width > 1

                        Behavior on width {
                            NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
                        }
                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }
                }

                Text {
                    id: volumeText
                    text: root.isMuted ? "MUTE" : Math.round(root.currentVolume * 100) + "%"
                    color: "#F8F9E8"
                    font.pixelSize: 14
                    font.bold: true
                    
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                    
                    Layout.preferredWidth: Math.ceil(Math.max(metricsPercent.width, metricsMute.width))
                    Layout.preferredHeight: Math.ceil(metricsPercent.height)
                }
            }
        }
    }
}