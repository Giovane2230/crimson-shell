import QtQuick
import Quickshell

Rectangle {
    id: root
    
    // Implementa interface IWidget
    readonly property string widgetName: "clock"
    readonly property string widgetVersion: "1.0.0"
    readonly property string widgetAuthor: "Crimson Team"
    readonly property int preferredPosition: 2 // Right
    
    property var config: {
        "format": "HH:mm",
        "show_date": false,
        "show_seconds": false
    }
    
    property bool isInitialized: false
    
    signal initialized()
    signal configChanged(var newConfig)
    
    // Visual
    color: "transparent"
    implicitWidth: timeText.implicitWidth + 20
    implicitHeight: parent ? parent.height : 32
    
    Text {
        id: timeText
        anchors.centerIn: parent
        color: "#ffffff"
        font.pixelSize: 14
        
        Timer {
            id: clockTimer
            interval: config.show_seconds ? 1000 : 60000
            running: root.isInitialized
            repeat: true
            onTriggered: updateTime()
        }
        
        function getFormat() {
            let fmt = config.format || "HH:mm"
            if (config.show_date) {
                fmt = "ddd MMM dd " + fmt
            }
            return fmt
        }
    }
    
    function updateTime() {
        timeText.text = Qt.formatDateTime(new Date(), timeText.getFormat())
    }
    
    function init() {
        console.log("Clock: initializing...")
        updateTime()
        isInitialized = true
        initialized()
    }
    
    function destroy() {
        console.log("Clock: cleaning up...")
        clockTimer.stop()
    }
    
    function updateConfig(newConfig) {
        console.log("Clock: updating config")
        config = Object.assign({}, config, newConfig)
        clockTimer.interval = config.show_seconds ? 1000 : 60000
        updateTime()
        configChanged(config)
    }
}