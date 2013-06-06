
import QtQuick 1.0
import Qt.labs.particles 1.0

    
Item {
    id: bp_
//    Rectangle {  anchors.fill: parent; color: "white" }
    
    Particles {
        id: par_
        anchors.fill: parent
        lifeSpan: 3000
        count: 0
        emissionRate: 0
        
        angle: 0
        angleDeviation: 360
        velocity: 30
        velocityDeviation: 10
        
        fadeInDuration : 0
        fadeOutDuration : 3
    }
    
    function position(block)
    {
        bp_.width = block.width * 1.2
        bp_.height = block.height * 1.2
        bp_.x = block.x + block.width / 2 - width / 2
        bp_.y = block.y + block.height / 2 - height / 2
        par_.burst(30);
        //        par_.source = "../images/ppo" + (1 + block.type) + ".png"
        par_.source = "../images/ppo" + (1 + block.type) + ".png"
        
        block.hit();
        
        bp_.destroy(4000);
    }
    
}    

