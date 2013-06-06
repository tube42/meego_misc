
import QtQuick 1.0

Image 
{
    id: block_
    property int size: 48
    property int type: 0
    
    property int x0
    property int x1
    property int x2
    property int y0
    property int y1
    property int y2
    
    
    source : "../images/o" + (1 + type) + ".png"
    width: size
    height: size
    smooth: true
    
    SequentialAnimation {
        id: animation
        
        ParallelAnimation {
            NumberAnimation { target: block_; property: "x"; to: x1; duration: 1500 }
            NumberAnimation { target: block_; property: "y"; to: y1; duration: 1500; easing.type: Easing.OutQuad }
        }        
        ParallelAnimation {
            NumberAnimation { target: block_; property: "x"; to: x2; duration: 2000 }
            NumberAnimation { target: block_; property: "y"; to: y2; duration: 2000; easing.type: Easing.InQuad }
        }
        ScriptAction { script: onAnimationEnd() }
        
    }    
    
    Behavior on opacity {
        NumberAnimation { duration: 500 }
    }    
    
    Behavior on scale {
        NumberAnimation { duration: 300 }
    }    
    
    
    PropertyAnimation on rotation {
        id: rota
        from: 0
        to: 360
        duration: 3000
        loops: Animation.Infinite 
    }
    
    /*
    Text {
        anchors.centerIn: parent
        color: "red"
        text: "" + parent.opacity + " " + parent.state
        }
    */
    // -------------------------------------------
    function hit()
    {
        state = "hit";
        opacity = 0
        scale = 1.4
        destroy(1000);
    }
    
    function onAnimationEnd()
    {
        block_.destroy();
    }
    function init(x0_, y0_, x1_, y1_, x2_, y2_)
    {
        x0 = x0_; x1 = x1_; x2 = x2_;
        y0 = y0_; y1 = y1_; y2 = y2_;
                
        state = "";
        block_.x = x0;
        block_.y = y0;
        state = "animating";
        
        // rotation stuff
        if(Math.random() < 0.5) {
            rota.from = 0
            rota.to = 360
        } else {
            rota.from = 360
            rota.to = 0            
        }
        rota.duration = 1000 + 4000 * Math.random();
        
        animation.start();
    }
}
