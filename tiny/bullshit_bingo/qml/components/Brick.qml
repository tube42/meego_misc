
import QtQuick 1.0

Rectangle 
{
    color: state === "pressed" ? "gray" : "black"
    opacity: 0.9
    Text {
        id: text_
        anchors.fill: parent
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter                
        font.pixelSize: 12
        wrapMode: Text.Wrap
        smooth: true
        text: model.message
        color: parent.state === "" ? "green" : "red"
    }
    MouseArea { 
        id: mouse_
        anchors.fill: parent
        onClicked: m_.check(index);
    }
}
