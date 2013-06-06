
import QtQuick 1.0

import "../js/constants.js" as Constants

Rectangle {
    id: button_

    property int fontSize: Constants.FONT_SIZE_NORMAL
    property string fontFamily: appFont

    property bool enabled: true
    property alias text: textItem.text
    height: fontSize * 1.7
    signal clicked;

    opacity: button_.enabled ? 1 : 0.12
    border.width: 3
    border.color: Constants.COLOR_FG
    color: Constants.COLOR_BG

    clip: true

    Text {
        id: textItem
        anchors.centerIn: parent
        font.pixelSize: button_.fontSize
        font.family: button_.fontFamily
        color: Constants.COLOR_FG
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: if(button_.enabled) parent.clicked();
    }

    states: [
        State {
            name: "down"
            when: enabled && mouse.pressed
            PropertyChanges { target: button_; opacity: 0.5 }
        }
    ]
}
