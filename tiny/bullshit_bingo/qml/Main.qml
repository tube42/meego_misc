import QtQuick 1.0

import "components"
import "js/logic.js" as Logic
import "js/data.js" as Data


Item
{
    id: m_; 
    width: 480; 
    height: 840; 
    
    property int cellWidth: width / 5
    property int cellHeight: cellWidth / 2
    property string lang: "eng"
    
    ListModel { id: bull }    
    
    Background {
        id: bg_
        anchors.fill: parent
    }
    
    Top {
        id: top_
        anchors.top: parent.top
        anchors.topMargin: 10
    }
        
    GridView  { 
        id: g_
        anchors.top: top_.bottom
        anchors.topMargin: 10
//        anchors.verticalCenter: parent.verticalCenter
        width: parent.width; 
        height: cellHeight * 12
        cellWidth: m_.cellWidth
        cellHeight: m_.cellHeight
        
        model: bull        
        delegate: Brick {
            width: m_.cellWidth - 2
            height: m_.cellHeight - 2
        }
    }        
    
    Text {
        anchors.centerIn: parent
        color: "red"
        font.pixelSize: 100
        font.bold: true
        text: "Moooo!!!"
        scale: m_.state === "" ? 0.1 : 1.0
        opacity: m_.state === "" ? 0 : 1
        Behavior on scale { NumberAnimation { duration: 2000; easing.type: Easing.InOutBack } }             
        Behavior on opacity { NumberAnimation { duration: 2000 } }             
    }
            
    function check(index) {
        // see if anymore with this same text should be checked
        var message = bull.get(index).message;
        
        
        for(var i = 0; i < bull.count; i++) {
            var message2 = bull.get(i).message;
            if(message2 === message ) 
                bull.get(i).item.state = "pressed";            
        }
            
        for(var j = 0; j < 9; j++)  {
            var cnt = 0
            for(var i = 0; i < 5; i++) 
            if(bull.get(i + j * 5).item.state === "pressed") cnt++;            
            if(cnt === 5) state = "bingo";
        }
    }
    
    Component.onCompleted: {       
        var size = 5 * 12;
        var data = Data.getData(lang);
        var bulls = Logic.getBoard(data, size);
        for(var i = 0; i < size; i++) bull.append( { "message" : bulls[i] } );
                
        // now get the brick references, _the hard way_
        for(var i = 0; i < g_.count; i++) {
            g_.currentIndex = i;
            bull.get(i)["item"] = g_.currentItem;
        }
    }
}
