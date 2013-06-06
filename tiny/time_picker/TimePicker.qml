/*
 * simple time picker component that kind of look like the Harmattan
 * time picker in the clock app .
 *
 * By @tube42
 */

import QtQuick 1.0

Image {
    id: ts_    
    source: "images/ts_bg.png"
    
    
    /* readonly */ property int  sec: Math.round(asec_ / 6)
    /* readonly */ property  int min: Math.round(amin_ / 6)
    smooth: true
    
    /* internal properties */
    property int type_ : 0    
    property int amin_: 0
    property int asec_: 0
    
    Behavior on asec_ { SpringAnimation { spring: 10; damping: 0.3; modulus: 360 } }        
    Behavior on amin_ { SpringAnimation { spring: 10; damping: 0.3; modulus: 360 } }        
    
    
    Image {
        id: m1
        source: "images/ts_mark1.png";
        x: (parent.width - width) / 2
        y: 96
        smooth: true
        
        transform: Rotation { 
            angle: ts_.asec_
            origin.x: 40
            origin.y: 104        
            axis { x: 0; y: 0; z: 1 }            
        }       
    }
    
    Image {
        source: "images/ts_mark2.png";
        x: (parent.width - width) / 2
        y: 14
        smooth: true
        
        transform: Rotation { 
            angle: ts_.amin_
            origin.x: 40
            origin.y: 186
            axis { x: 0; y: 0; z: 1 }            
        }               
    }
    
    MouseArea {
        anchors.fill: parent
        onPressed: set(mouse.x, mouse.y, true);
        onPositionChanged: set(mouse.x, mouse.y, false);
        onReleased: set(mouse.x, mouse.y, false);
    }
    
    /*********************************************************************/
    
    function set(x, y, first)
    {
        var R_MAX = 190, R_MIN = 30, R_SEC = 110;
        
        var dx = (width / 2 - x);
        var dy = (height / 2 - y);
        
        if(first) {            
            var r = Math.sqrt(dx * dx + dy * dy);
            if(r < R_MIN || r > R_MAX) type_ = 0;
            else if(r < R_SEC) type_ = 1;
            else type_ = 2;
        }
        
        
        if(type_ != 0) {
            var angle = get_angle(dx, dy);
            if(type_ == 1) asec_ = angle;
            else amin_ = angle;
        }
    }
    
    function get_angle(dx, dy)
    {
        /* I am pretty sure there is a simpler way to do this, but
         * I just can't remember right now how it goes */
          
        if(dy == 0) {
            return dx > 0 ? -90 : +90;
        } else {
            var p = Math.abs(dx / dy);
            p = Math.atan( p) * 180 / Math.PI;
            if(dy < 0) p = 180 - p;
            if(dx < 0) p = 360 - p;
            return  360 - p;
        }
    }
}
