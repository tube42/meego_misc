
import QtQuick 1.0
import Qt.labs.particles 1.0

Rectangle
{
    id: block_
    color: "black"
    property bool active: true
    
    
    Particles {
        anchors.top: parent.top
        anchors.left: parent.left
        width: 1
        height: 1
        
        source: "../images/bgpart1.png"
        lifeSpan: 5000
        emissionRate : 1
        emissionVariance: 1        
        count: active ? 2 : 0
        angle: 30
        angleDeviation: 45
        velocity: 100
        velocityDeviation: 10
    }   
    
    Particles {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        
        width: 1
        height: 1
        
        
        source: "../images/bgpart2.png"
        lifeSpan: 5000
        count: active ? 2 : 0
        emissionRate : 1          
        emissionVariance: 1       
        angle: -30
        angleDeviation: 45
        velocity: 100
        velocityDeviation: 10
    }     
    Particles {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 1
        height: 1
        
        source: "../images/bgpart1.png"
        lifeSpan: 5000
        emissionRate : 1
        emissionVariance: 1        
        count: active ? 2 : 0
        angle: 60 + 90
        angleDeviation: 45
        velocity: 100
        velocityDeviation: 10
    }   
    
    Particles {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        
        width: 1
        height: 1
        
        
        source: "../images/bgpart2.png"
        lifeSpan: 5000
        count: active ? 2 : 0
        emissionRate : 1          
        emissionVariance: 1       
        angle: -60 - 90
        angleDeviation: 45
        velocity: 100
        velocityDeviation: 10
     }         
}
