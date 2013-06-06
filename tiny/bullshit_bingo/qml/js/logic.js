
var getBoard = function(data, size)
{
    var bulls = data;
    
    // need more of these
    while(bulls.length < size)  {
        bulls = bulls.concat( bulls, bulls);
    }
    
    // randomize
    for(var i = 0; i < bulls.length; i++) {
        var j = Math.floor(Math.random() * bulls.length);
        var tmp = bulls[i]; bulls[i] = bulls[j]; bulls[j] = tmp;
    }      
    
    return bulls;
}
