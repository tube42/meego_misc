import QtQuick 1.0

Rectangle {
    id: page
    color: "white"
    width: 480
    height: 840
    
    
    TimePicker {
        id: ts
        anchors.centerIn: parent
    }
    
    Text {
        anchors.bottom: ts.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        
        font.pixelSize: 72
        color: "black"
        text: ts.min + ":" + ts.sec
    }
}
