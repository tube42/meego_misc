/* copied from Wordy */

var debug = true

// protos:
// void on_sucess(object obj, object userdata)
// void on_failure(int http_code, string msg, object userdata)



function access_url(url, on_success, on_failure, userdata)
{
    /*
    console.log("ACCES_URL.url", url);
    console.log("ACCES_URL.on_sucess", on_success);
    console.log("ACCES_URL.on_failure", on_failure);
    console.log("ACCES_URL.userdata", userdata);
    */
    try {
        var doc = new XMLHttpRequest();
        doc.open("GET", url);
        
        // get the results
        doc.onreadystatechange = function() {                        
            if(doc.readyState == 4) {
                var n = doc.status / 100;
                
                if(debug) console.log("access: status = ", doc.status);
                
                if(n == 2) {                    
                    on_success(doc, userdata);
                } else {
                    on_failure(doc.status, "HTTP error " + doc.status, userdata);
                }
            }            
        }
        doc.send();
    } catch(error) {
        console.log("server error:", error);
        on_failure(-1, "" + error, userdata);   
    }    
}

function access(url, params, on_success, on_failure, userdata)
{
    // set together the parameter string
    var pstr = "";
    var first = url.indexOf('?') < 0 ? true : false
    
    for(var x in params) {
        pstr += (first ? '?' : '&')
        pstr = pstr + escape(x) + "=" + escape(params[x]);
        first = false
    }
    var url = url + pstr
    
    if(debug) console.log("accessing" , url); // DEBUG
    
    // connect the to server
    access_url(url, on_success, on_failure, userdata)
}


// -----------------------------------------------------

function accessText(url, params, on_success, on_failure, userdata)
{
    access(url, params, function(doc) { on_success(doc.responseText, userdata); }, on_failure, userdata);
}


function accessJson(url, params, on_success, on_failure, userdata)
{
    try {
        access(url, params, function(doc) {
               var txt = doc.responseText;
               
               // console.log("accessJson", url, "=>" , txt); // DEBUG
               
               // remove chars we dont line
               txt = txt.replace('(', ' ');
               txt = txt.replace(')', ' ');
               txt = txt.replace(';', ' ');           
               var obj = eval( "(" + txt + ")");               
               
               on_success(obj, userdata);               
           }, on_failure, userdata);        
        } catch(error) {
            on_failure(-1, "" + error, userdata);
    }
}


function accessXml(url, params, on_success, on_failure, userdata)
{
    try {
        access(url, params, function(doc) {
               on_success(doc.responseXML, userdata);               
           }, on_failure, userdata);        
        } catch(error) {
            on_failure(-1, "" + error, userdata);
    }
}
