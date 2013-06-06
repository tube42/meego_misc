import QtQuick 1.0

import "../js/constants.js" as Constants

Item {
    id: page

    property string errorMessage: "no error"
    state: "empty"

    ListModel {
        id: filteredModel
    }

    Text {
        id: messageText
        anchors.centerIn: page
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.Wrap
        visible: page.state != "show"
        font.pixelSize: Constants.FONT_SIZE_NORMAL
        color: Constants.COLOR_FG
        text: {
            if(page.state == "error") return errorMessage;
            if(page.state == "empty") return "Inga poster funna";
            if(page.state == "short") return "Nummer för kort"
            return "";
        }
    }

    Item {
        id: serachGroup
        anchors.fill: parent

        SearchEdit {
            id: searchEdit
            anchors.top:  parent.top
            anchors.left:  parent.left
            anchors.right:  parent.right
            anchors.topMargin:  10
            anchors.bottomMargin:  10
            onTextChanged: updateFilter();
        }

        ListView {
            id: searchList
            anchors { top: searchEdit.bottom; left: parent.left; bottom:  parent.bottom; right:  parent.right }

            visible: page.state == "show"

            model: filteredModel
            delegate: listDelegate
            clip: true
         }
    }

    Component {
        id: listDelegate

        Rectangle {
            height: 20 + Constants.FONT_SIZE_NORMAL + 2 * Constants.FONT_SIZE_SMALL
            color: (index & 1) == 0 ? "#202020" : "#505050";
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
                    height: 2 * Constants.FONT_SIZE_SMALL
                    wrapMode: Text.Wrap

                    text: name
                    font.pixelSize: Constants.FONT_SIZE_SMALL
                    color: Constants.COLOR_FG
                }
            }
        }
    }

    // ----------------------------------------

    function updateFilter()
    {
        var text = searchEdit.text;

        console.log("UPDATE FILTER") // DEBUG

        if(text.length < 4) page.state = "short"
        else {
            filteredModel.clear();
            for(var i = 0; i < listData.count; i++) {
                var entry = listData.get(i);
                // if(entry.number.beginsWith(text))
                if(entry.number.indexOf(text) == 0)
                    filteredModel.append(entry);
            }
            page.state = (filteredModel.count == 0) ? "empty" : "show"

            console.log("filteredModel.count ", filteredModel.count ); // DEBUG
        }
    }

    function reloadList()
    {
        updateFilter();
        console.log("RELOAD LIST") // DEBUG
    }

    function setError(message)
    {
        console.log("SET MESAGE") // DEBUG

        page.state = "error"
        errorMessage = message;
    }

    function setNumber(number)
    {
        searchEdit.text = number;
        updateFilter();
    }
}
