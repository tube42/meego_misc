import QtQuick 1.0

ListView {
    width: 360
    height: 600
    spacing: 10
    
    delegate : Text { 
        text: "<b>" + title + "</b><br>\n" + desc;
        width: parent.width
        wrapMode: Text.Wrap
        textFormat: Text.RichText
        color:  (index & 1) ? "brown" : "black"
        font.pixelSize: 16
        
        Rectangle { 
            anchors.fill: 
            parent; z : -1; 
            color: (index & 1) ? "darkGray" : "white" 
        }
    }
    
    model: xmlModel

    XmlListModel {
     id: xmlModel
     source: "http://www.reddit.com/r/jokes/.xml"
     query: "/rss/channel/item"
     XmlRole { name: "title"; query: "title/string()" }
     XmlRole { name: "desc"; query: "description/string()" }
 }    
}
