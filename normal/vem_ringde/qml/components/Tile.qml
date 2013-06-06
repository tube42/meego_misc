
import QtQuick 1.0

import "../js/constants.js" as Constants

Rectangle {
    id: tile_
    
    property bool enabled: true
    property alias text1: text1.text
    property alias text2: text2.text
    
    signal clicked;
    
    opacity: tile_.enabled ? 1 : 0.12
    color: Constants.COLOR_STYLE
    
    clip: true
    
    Text {
        id: text1
        anchors.centerIn: parent       
        font.pixelSize: Constants.FONT_SIZE_NORMAL
        font.family: appFont
        color: Constants.COLOR_FG
        smooth: true
    }
    
    Text {
        id: text2
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: Constants.FONT_SIZE_SMALL / 2
        anchors.bottomMargin: Constants.FONT_SIZE_SMALL / 2
        
        font.pixelSize: Constants.FONT_SIZE_SMALL
        font.family: appFont
        color: Constants.COLOR_FG
        smooth: true

        width: parent.width - Constants.FONT_SIZE_SMALL
        wrapMode: Text.Wrap
    }
    
    
    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: if(tile_.enabled) parent.clicked();
    }
    
    states: [
        State {
            name: "down"
            when: tile_.enabled && mouse.pressed
            PropertyChanges { target: tile_; opacity: 0.5 }
        }
    ]        
}
