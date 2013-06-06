import QtQuick 1.0

import "../js/db.js" as Db
import "../js/json.js" as Json
import "../js/server.js" as Server
import "../js/constants.js" as Constants

QtObject {



    // ----------------------------------------------------------------
    // UI logic
    // ----------------------------------------------------------------
    property variant indexMap: [ "menu", "nummer", "search", "history", "list", "about"];

    function setPage(index)
    {
        console.log("INDEX IN", index, "STATE", state)

        if(app.state != indexMap[index]) {
            app.state = indexMap[index];
            mv.showPage(index);
            console.log("INDEX *SET*", index, "STATE", state)
            return;
        }
        console.log("INDEX OUT", index, "STATE", state)
    }


    // ----------------------------------------------------------------
    // list database
    // ----------------------------------------------------------------
    function downloadListOk(text, crap)
    {
        console.log(text);
        saveCachedDatabaseList(text);
        setListDatabase(text);        
    }
    
    function setListDatabase(data)
    {
        var json = Json.unserialize(data, false);
        
        var data = json["data"]
        if(!data) {
            listPage.setError("Data saknas");
            return
        }
        
        listData.clear();
        
        for(var i = 0; i < data.length; i++) {
            var row = data[i];
            var name = row["name"]
            var number = row["number"]
            if(name && number) {
                listData.append( { 'name': name, 'number' : number } );                                
            }
        }
    }

    function downloadListFailed(code, msg, crap)
    {
        listPage.setError("Kunde inte hämta lista\n\n" + msg);
        console.log("ERROR", msg);        
    }
    
    function downloadListDatabase()
    {
        console.log("Donwloading database from internet...");
        Server.accessText(Constants.URL_LIST, { }, downloadListOk, downloadListFailed, null)
    }        
    
    function loadCachedListDatabase()
    {
        console.log("Loading database from cache...");        
        var list_data = Db.get("list.data", undefined);
        if(list_data) setListDatabase(list_data);
    }        
    
    function saveCachedDatabaseList(text)
    {
        var date = new Date();
        var time_now = Math.floor(date.getTime() / (3600 * 24 * 1000));        
        Db.set("list.data", text);
        Db.set("list.time", time_now);
    }
    
    
    function getListDatabase()
    {
        // see if its cached
        var cached = false
        var list_data = Db.get("list.data", undefined);
        var list_time = Db.get("list.time", undefined);
        
        if(list_data && list_time) {
            var date = new Date;
            var time_now = Math.floor(date.getTime() / (3600 * 24 * 1000));        
            if(time_now < parseInt(list_time) + 7)  cached = true;
        }
        
        if(cached) loadCachedListDatabase();
        else downloadListDatabase();
        
    }
}
