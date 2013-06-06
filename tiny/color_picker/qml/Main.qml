import QtQuick 1.0

Rectangle {
    color: Qt.tint(r0.color, "#802080FF");
    property real rgba_r: 0.5
    property real rgba_g: 0.5
    property real rgba_b: 0.5
    Column { 
        id: cols
        anchors.centerIn:parent; width: parent.width; spacing: 10
        
        Rectangle { 
            id: r0a; width: parent.width; height : 20; color: Qt.darker(r0.color) 
            Text { anchors.centerIn: parent; font.pixelSize: 15; color: "red"; text: "darker: "+r0a.color }            
        }        
        Rectangle {
            id: r0; width: parent.width; height : 80; color: Qt.rgba(rgba_r, rgba_g, rgba_b, 1);  
            Text { anchors.centerIn: parent; font.pixelSize: 38; color: "red"; text: ""+r0.color }            
        }        
        Rectangle {
            id: r0b; width: parent.width; height : 20; color: Qt.lighter(r0.color) 
            Text { anchors.centerIn: parent; font.pixelSize: 15; color: "red"; text: "lighter: "+r0b.color }
        }        
        Item {id: space; width: 1; height: 100 }
        Rectangle {id: r1; width: parent.width; height : 80; color: Qt.rgba(rgba_r,0,0,1); }            
        Rectangle {id: r2; width: parent.width; height : 80; color: Qt.rgba(0,rgba_g,0,1); }            
        Rectangle {id: r3; width: parent.width; height : 80; color: Qt.rgba(0,0,rgba_b,1); }    
    }
    MouseArea {
        anchors.fill: cols
        onPressed: set(mouseX, mouseY);
        onPositionChanged: set(mouseX, mouseY);
    }
    function set(x, y) {
        var obj = cols.childAt(x, y);
        var c = x / Math.max(1, width);        
        if(obj == r1) rgba_r = c;
        if(obj == r2) rgba_g = c;
        if(obj == r3) rgba_b = c;   
    }        
}
