

import QtQuick 1.0

import "../js/constants.js" as Constants


Item {
    id: menu

    property int sizeArrow: Math.round(width * 0.05) * 2
    property int size: (width - sizeArrow) * 0.40

    Image {
        id: arrowImage

        anchors.right: parent.right
        anchors.top: tilesFlick.top
        anchors.rightMargin:  sizeArrow * 0.2
        anchors.topMargin:  sizeArrow * 0.2

        width: sizeArrow; height:  sizeArrow

        source: "../images/arrow.png"
        smooth: true
        opacity: 1

        rotation: (app.state == "menu") ? 0: 180
        Behavior on rotation { NumberAnimation { duration: 250 } }
    }

    Text {
        id: text_
        anchors.left: parent.left
        anchors.right: arrowImage.left; // parent.right
        anchors.top: parent.top
        anchors.topMargin: 8
        
        text: Constants.APP_NAME
        color: Constants.COLOR_STYLE
        font.pixelSize : Constants.FONT_SIZE_NORMAL
        
        font.family: appFont        
        horizontalAlignment: Text.AlignHCenter        
    }
  
    Flickable {
        id: tilesFlick
        anchors.left: parent.left
        anchors.right: arrowImage.left; // parent.right
        anchors.top: text_.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 32
        anchors.leftMargin: 8

        flickableDirection: Flickable.VerticalFlick

        contentWidth: parent.width
        contentHeight: grid.height
        clip: true
        
//        spacing: width * 0.1
        
        Grid {
            id: grid
            columns: 2
//            anchors.horizontalCenter: parent.horizontalCenter
            spacing: parent.width * 0.05
            
            
            Tile {
                width: size
                height: size
                text1: "Slå upp"
                text2: "Sök på nummer"
                onClicked: logic.setPage(1);
            } 
            


            Tile {
                width: size
                height: size
                text1: "Lista"
                text2: "Visa lista över kända nummer"
                onClicked: logic.setPage(2)
            }
            Tile {
                width: size
                height: size
                text1: "Historik"
                text2: "Senast sökta nummer"
                onClicked: logic.setPage(4)
            }
            Tile {
                width: size
                height: size
                text1: "Om"
                text2: "Om programmet"
                onClicked: logic.setPage(5)
            }
            
            Tile {
                width: size
                height: size
                text1: "Avsluta"
                text2: "Lämna programmet"
                onClicked: Qt.quit();
            }             
        }
    }
}
