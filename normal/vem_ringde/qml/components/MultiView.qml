
// import Qt 4.7
import QtQuick 1.0

Item {
    id: multiView
    
    property int userHeight: list.height
    property int userWidth: width
    
    property int fontSize: 48
    property string fontFamily: "Serif"
    property string colorActive: "white"
    property string colorInactive: "gray"
    
    property int currentIndex: 0
    
    default property alias content: visualModel.children
    
    signal selectionChanged(int index);

    function showPage(index)
    {
        if(index != currentIndex) {
            currentIndex = index;
        }
    }
        
    // ------------------------------------------------------
    /*
    Rectangle {
        id: debugStuff
        x: 0; y: 0; width: parent.width; height: 20; color: "red"
        Text { anchors.centerIn: parent; color: "green"; text: "" + topBar.x }
    }
    */

    ListView {
        id: topBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height:  fontSize * 1.2
    
        
        model: visualModel.children
        spacing: fontSize * 0.8
        orientation: ListView.Horizontal
        clip: true
        
        preferredHighlightBegin : width * 0.2
        preferredHighlightEnd : width * 0.6

        highlightRangeMode: ListView.StrictlyEnforceRange               
        highlightMoveDuration: 350

        currentIndex: multiView.currentIndex
        
        onMovementEnded: {
            if(multiView.currentIndex != topBar.currentIndex) {
                multiView.currentIndex = topBar.currentIndex;
                selectionChanged(multiView.currentIndex);
            }
        }

        
        delegate: Text {            
            anchors.verticalCenter: parent.verticalCenter
            
            font.pixelSize: fontSize
            font.family: fontFamily
            color: ListView.isCurrentItem ? colorActive : colorInactive
            text: name
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // if(index != topBar.currentIndex) {
                    if(multiView.currentIndex != index) {
                        multiView.currentIndex = index;
                        selectionChanged(multiView.currentIndex);
                    }
                }
            }
            
            transitions: Transition {
                NumberAnimation { properties: "scale,y" }
            }
            
        }
    }
    
    ListView {
        id: list
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        
        currentIndex: multiView.currentIndex
        onCurrentIndexChanged: {
            if(currentIndex != multiView.currentIndex) {
                multiView.currentIndex = currentIndex
                selectionChanged(multiView.currentIndex);
            }
        }
            
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.DragOverBounds
        model: visualModel

        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 350
        
        snapMode: ListView.SnapOneItem
    }
    
    VisualItemModel { 
        id: visualModel 
    }        
}
