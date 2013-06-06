/* copied from Wordy */

// homemade josn mini library by yours truely

function serialize(obj)
{
    switch(typeof obj) {
        
        // baisc types
        case 'boolean':
        case 'number':
        case 'function': return "" + obj;        
        case 'string': return "'" + obj + "'";
        
        // complex types
        case 'object': 
        if(obj.constructor === Array) {
            var ret = "[";
            for(var i = 0; i < obj.length; i++) {
                if(i > 0) ret += ",";
                ret += serialize(obj[i]);
            }
            return ret + "]"
        } else {
            var ret = "{";
            var first = true;
            for(var i in obj) {
                if(!first) ret += ",";
                first = false;                
                ret += serialize(i) + ":" + serialize(obj[i]);
            }
            return ret + "}";
        }
        default:
        return "" + obj; // Unknown :(
    }
}

function unserialize(txt, unsafe)
{ 
    if(!unsafe) {
        // remove chars we dont line
        txt = txt.replace('(', ' ');
        txt = txt.replace(')', ' ');
        txt = txt.replace(';', ' ');
    }
    return eval( "(" + txt + ")" );
}

