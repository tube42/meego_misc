import QtQuick 1.0

import "../js/constants.js" as Constants


Item {
    id: numberPage

    signal numberChanged(string number);

    // the display
    Item {
        id: display

        property int fontSize: Constants.FONT_SIZE_LARGE * 0.75
        anchors.top:  parent.top
        anchors.left:  parent.left
        anchors.right:  parent.right
        anchors.margins: fontSize / 2

        height: fontSize * 1.5

        clip: true

        Text {
            id: displayText
            color: Constants.COLOR_FG
            font.pixelSize: parent.fontSize
//            font.family: appFont
            anchors.verticalCenter:  parent.verticalCenter
            anchors.left:  parent.left
            anchors.right:  parent.right
            clip: true
            text: "0454760200"
        }

        Image {
            source: "../images/delete.png"
            anchors.verticalCenter:  parent.verticalCenter
            anchors.right:  parent.right
            height: parent.fontSize * 0.8
            fillMode: Image.PreserveAspectFit
            smooth:  true
            opacity: displayText.text == "" ? 0.1 : (deleteMouse.pressed ? 0.8 : 1.0);
            MouseArea {
                id: deleteMouse
                anchors.fill: parent
                onClicked: numberPage.do_delete();
            }
        }
    }

    Item {
        id: buttons
        anchors.bottom:  bottomItem.top
        anchors.top:  display.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20

        property int bWidth: width / 3.5
        property int bHeight: Math.min(bWidth, height / 4.5)
        property int fontSize: Math.min(bHeight * 0.8, Constants.FONT_SIZE_LARGE);

        Grid {
            anchors.centerIn: parent
            columns:  3
            spacing: 5
            Repeater {
                model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "#", "0", "*" ]
                Rectangle {
                    property bool hiden: (index == 9 || index == 11)
                    width: buttons.bWidth; height: buttons.bHeight
                    border.width: 1
                    color: hiden ? "#808080" : (dialMouse.pressed ? "#202020" : "#404040")

                    Text {
                        anchors.centerIn:  parent
                        color: Constants.COLOR_FG
                        font.pixelSize: buttons.fontSize
                        text: "" + modelData
                    }
                    MouseArea {
                        id: dialMouse
                        anchors.fill: parent
                        onClicked: if(!hiden) numberPage.do_dial(modelData)
                    }
                }
               }
        }
    }

    // buttons on the bottom
    Item {
        id: bottomItem
        anchors.bottom:  parent.bottom
        anchors.left: parent.left
        anchors.right:  parent.right
        height:  bCheck.height * 1.5

        Button {
            id: bCheck
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 20
            text: "Slå upp"
            onClicked: numberPage.on_check_number();

            enabled: displayText.text.length > 4
        }
    }


    // --------------------------------------
    function do_dial(number)
    {
        if(number != "*" && number != "#" && displayText.text.length < 14)
            displayText.text += number

        console.log("DIALED", number)
    }

    function do_delete()
    {
        var text = displayText.text;
        if(text.length > 0) {
            text = text.substring(0, text.length-1)
            displayText.text = text;
        }
    }
    function on_check_number()
    {
        var text = displayText.text;
        // TODO
        console.log("on check number", text);

        numberChanged(text)
    }
}

