import QtQuick 1.0

import "components"
import "js/Logic.js" as Logic

Item
{
    id: main_
    
    property int px
    property int py
    property bool pdown: mouse.pressed
    property bool active: true
    
    Background {
        id: background
        anchors.fill: parent
        active: main_.active
    }
    
    Item {
        id: canvas
        anchors.fill: parent
    }

    
    Pointer {
        id: pointer
        x: main_.px - width / 2
        y: main_.py - height / 2
        active: main_.pdown
    }
    
    Trail { pointer: pointer; level: 1   }
    Trail { pointer: pointer; level: 2   }
    Trail { pointer: pointer; level: 3   }
    Trail { pointer: pointer; level: 4   }
    Trail { pointer: pointer; level: 5   }
    Trail { pointer: pointer; level: 6   }
    Trail { pointer: pointer; level: 7   }
    Trail { pointer: pointer; level: 8   }
    Trail { pointer: pointer; level: 9   }
    
    MouseArea {
        id: mouse
        anchors.fill: parent
        
        property int x_old
        property int y_old
        
        onPressed: set(mouseX, mouseY, true);
        onPositionChanged: set(mouseX, mouseY, false)
        
        function set(x, y, new_) {
            
            main_.px = x;
            main_.py = y; 
            
            if(new_) {
                x_old = x;
                y_old = y;
            }
            var dx = x- x_old;
            var dy = y - y_old;
            var delta = Math.sqrt(dx * dx + dy * dy);
            
            var points = Math.max( 1, Math.floor( delta / 20));
            dx /= points;
            dy /= points;
            
            var x0 = x_old
            var y0 = y_old;
            for(var i = 0; i < points; i++) {
                var obj = canvas.childAt(x0, y0);
                if(obj && obj.state !== "hit") Logic.board.hit(obj); 
                x0 += dx;
                y0 += dy;
            }
                
                /*
            var obj = canvas.childAt(x, y);            
            if(obj && obj.state !== "hit") Logic.board.hit(obj); 
            */
            
            x_old = x;
            y_old = y;
        }
    }
    
    Timer {
        property int level : 0
        interval: Math.max( 200, 1500 - level * 10)
        running: main_.active
        repeat: true
        onTriggered: {
            Logic.board.addOne();
            level ++;
        }
    }    
    function getBoard() { return Logic.board; }
        
    Component.onCompleted:
    {        
        Logic.board = new Logic.Board(canvas, main_);
    }
}
    
