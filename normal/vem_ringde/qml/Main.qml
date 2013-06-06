import QtQuick 1.0

import "components"
import "js/constants.js" as Constants


Rectangle {
    id: app
    color: "black"
    state: "menu"
    
    property string appFont: "Verdana"
    
    // logic
    Logic {
        id: logic
    }

    // data
    ListModel {
        id: listData
    }

    // MV
    MultiView {
        id: mv
        
        fontFamily: appFont
        fontSize: Constants.FONT_SIZE_LARGE
        anchors.fill: parent

        onSelectionChanged: logic.setPage(index)


        MenuPage {
            property string name: "Menu"
            width: mv.userWidth; height: mv.userHeight
        }

        NumberPage {
            property string name: "Slå nummer"
            width: mv.userWidth; height: mv.userHeight

            onNumberChanged: {
                searchPage.setNumber(number)
                logic.setPage(3);
            }
        }

        ListPage {
            id: listPage
            property string name: "Lista"
            width: mv.userWidth; height: mv.userHeight
        }

        SearchPage {
            id: searchPage
            property string name: "Sök"
            width: mv.userWidth; height: mv.userHeight
        }

        HistoryPage {
            property string name: "Historik"
            width: mv.userWidth; height: mv.userHeight
        }
        AboutPage {
            property string name: "Om"
            width: mv.userWidth; height: mv.userHeight
        }


    }


    Component.onCompleted: {
        
        listPage.reloadList();        
        logic.getListDatabase();
        
//        logic.downloadListDatabase();
//        logic.populateListDatabase(listData);

        console.log("COUNT- ", listData.count)
    }
}
