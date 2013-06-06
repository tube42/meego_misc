
import QtQuick 1.0
import Qt.labs.particles 1.0

Item
{
    id: pointer_
    width: 22
    height: 22
    property bool active: false
    
    
    // TODO: get the pointer to leave a trail of particles when active
    
    /*
    Particles {
        anchors.centerIn: parent
        source: "../images/pp.png"
         lifeSpan: 5000
         count: 1000
         emissionRate: pointer_.active? 100 : 0
         angle: 0
         angleDeviation: 10
         velocity: 0
         velocityDeviation: 0.2
         
         fadeInDuration : 0
         fadeOutDuration : 3
     }*/
    
    Rectangle {
        anchors.fill: parent
        color: "white"
        opacity: pointer_.active ? 0.2 : 0
        
        Behavior on opacity {
            NumberAnimation { duration: 1000 }
        }    
        
    }
    
        
    
}
