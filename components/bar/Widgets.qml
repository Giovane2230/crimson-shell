import QtQuick

QtObject {
    // Interface que todo widget deve implementar
    
    required property string widgetName
    required property string widgetVersion
    
    // Configuração do widget
    property var config: ({})
    
    // Callbacks
    signal initialized()
    signal configChanged(var newConfig)
    
    // Métodos que devem ser implementados
    function init() { console.warn("init() not implemented") }
    function destroy() { console.warn("destroy() not implemented") }
    function updateConfig(newConfig) { 
        config = newConfig
        configChanged(newConfig)
    }
}