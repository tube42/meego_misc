import QtQuick 1.0

import "../js/constants.js" as Constants

Item {
    id: page



    Text {
        id: errorText
        anchors.centerIn: page
        width: parent.width
        wrapMode: Text.Wrap
        visible: false
        font.pixelSize: Constants.FONT_SIZE_NORMAL
        color: Constants.COLOR_FG
    }


    ListView {
        anchors.fill: parent
        model: listData
        delegate: listDelegate
        clip: true
     }

    Component {
        id: listDelegate

        Rectangle {
            height: 20 + Constants.FONT_SIZE_NORMAL + Constants.FONT_SIZE_SMALL
            color: (index & 1) == 0 ? "gray" : "darkGray";
            width:parent.width

            Column {
                anchors.centerIn: parent
                width: parent.width * 0.9
                spacing: 10
                Text {
                    width: parent.width
                    text: number
                    font.pixelSize: Constants.FONT_SIZE_NORMAL
                    color: Constants.COLOR_FG
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    width: parent.width
                    text: name
                    font.pixelSize: Constants.FONT_SIZE_SMALL
                    color: Constants.COLOR_FG
                }
            }
        }
    }

    // ----------------------------------------
    states:  [
        State {
            name: "error"
            },
        State {
            name: "loaded"
            PropertyChanges { target: errorText; visible: true }
            }
    ]
    // ----------------------------------------

    function reloadList()
    {
        page.state = "loaded"
    }

    function setError(message)
    {
        page.state = "error"
        errorText.errorMessage = message
    }
}
