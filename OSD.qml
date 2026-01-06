import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: root

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	Connections {
		target: Pipewire.defaultAudioSink && Pipewire.defaultAudioSink.audio ? Pipewire.defaultAudioSink.audio : null

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}

		function onMutedChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}

	property bool shouldShowOsd: false
	property real currentVolume: Pipewire.defaultAudioSink && Pipewire.defaultAudioSink.audio ? Pipewire.defaultAudioSink.audio.volume : 0
	property bool isMuted: Pipewire.defaultAudioSink && Pipewire.defaultAudioSink.audio ? Pipewire.defaultAudioSink.audio.muted : false

	function getVolumeIconPath() {
		if (isMuted) return Quickshell.iconPath("audio-volume-muted-symbolic") || Quickshell.iconPath("audio-volume-off");
		if (currentVolume < 0.33) return Quickshell.iconPath("audio-volume-low-symbolic") || Quickshell.iconPath("audio-volume-low");
		if (currentVolume < 0.66) return Quickshell.iconPath("audio-volume-medium-symbolic") || Quickshell.iconPath("audio-volume-medium");
		return Quickshell.iconPath("audio-volume-high-symbolic") || Quickshell.iconPath("audio-volume-high");
	}

	Timer {
		id: hideTimer
		interval: 2000
		onTriggered: root.shouldShowOsd = false
	}

	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {

			anchors.bottom: true
			margins.bottom: screen.height / 5
			exclusiveZone: 0

			implicitWidth: 400
			implicitHeight: 50
			color: "transparent"

			mask: Region {}

			Rectangle {
				anchors.fill: parent
				radius: height / 2
				color: "#80000000"

				RowLayout {
					anchors {
						fill: parent
						leftMargin: 10
						rightMargin: 15
					}
					spacing: 15

					Rectangle {
						Layout.fillWidth: false
						implicitWidth: 30
						implicitHeight: 30
						color: "transparent"
						
						IconImage {
							anchors.fill: parent
							source: root.getVolumeIconPath()
							opacity: root.isMuted ? 0.5 : 1.0
							
							Behavior on opacity {
								NumberAnimation { duration: 150 }
							}
						}
					}

					Rectangle {
						Layout.fillWidth: true

						implicitHeight: 10
						radius: 20
						color: "#50ffffff"

						Rectangle {
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}

							width: parent.width * root.currentVolume
							radius: parent.radius
							color: root.isMuted ? "#666666" : "#4da6ff"

							Behavior on width {
								NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
							}

							Behavior on color {
								ColorAnimation { duration: 150 }
							}
						}
					}

					Text {
						text: root.isMuted ? "MUTE" : Math.round(root.currentVolume * 100) + "%"
						color: "white"
						font.pixelSize: 14
						font.bold: true
						Layout.minimumWidth: 45

						Behavior on opacity {
							NumberAnimation { duration: 150 }
						}
					}
				}

				Behavior on opacity {
					NumberAnimation { duration: 200 }
				}
			}
		}
	}
}