import QtQuick 1.0

import "../js/constants.js" as Constants


Item {
    id: searchEdit
    signal textChanged(string text)
    property alias text: textInput.text

    height: 10 + Constants.FONT_SIZE_NORMAL * 1.8
    Rectangle {
        anchors { left: parent.left; right: parent.right; top: parent.top; bottom: parent.bottom; margins: 5 }
        radius: Constants.FONT_SIZE_NORMAL / 2
        color: Constants.COLOR_BG
        border.color: Constants.COLOR_BORDER
        border.width:  2

        TextInput {
            id: textInput
            anchors { left: parent.left; right: parent.right; leftMargin: Constants.FONT_SIZE_NORMAL / 2; rightMargin: Constants.FONT_SIZE_NORMAL / 2 }
            anchors.verticalCenter: parent.verticalCenter
            color: Constants.COLOR_FG
            selectionColor: Constants.COLOR_STYLE
            font.pixelSize: Constants.FONT_SIZE_NORMAL
            // inputMask : "0123456789"
            inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPredictiveText
            maximumLength : 18

            onTextChanged:  searchEdit.textChanged(text) //D EBUG

        }
    }

}
