
import QtQuick 1.0


Rectangle 
{
    
    property variant pointer
    property int level: 1
    
    opacity: pointer.opacity / (1 + Math.abs(level - 4))
    width: pointer.width
    height: pointer.height
    x: pointer.x
    y: pointer.y
        
    color: "grey"
    
    visible: pointer.active
    Behavior on x { 
        NumberAnimation { 
            duration: 30 + 10 * (1 + level) 
            easing.type: Easing.Linear            
        }  
    } 
    Behavior on y { 
        NumberAnimation { 
            duration: 30 + 10 * (1 + level) 
            easing.type: Easing.Linear                        
        }
    }
}
