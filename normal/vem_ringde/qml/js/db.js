
/* copied from Wordy */


var debug = false

function getDB()
{
    return openDatabaseSync("vemringde_db", "0.2", "", 1000000);    
}

function createTables(tx) 
{
    tx.executeSql('CREATE TABLE IF NOT EXISTS settings(key TEXT, data TEXT)', []);
}  


function get(key, default_value)
{
    var ret = default_value
    try {    
        var db = getDB();
        db.transaction( function(tx) {
                   createTables(tx);
                   var rs = tx.executeSql("SELECT key, data FROM settings WHERE key = ?", [key ])
                   if(rs && rs.rows.length === 1) ret = rs.rows.item(0).data;
               }
               );
    } catch(error) { console.log("DB ERROR", db);  }
        
    if(debug) console.log("Db.get(", key, ") = ", ret); // DEBUG    
    
    return ret;
}
    
function set(key, data)
{
    if(debug) console.log("Db.set(", key, ",", data, ")"); // DEBUG
    
    try {    
        var db = getDB();
    
    db.transaction( function(tx) {
                   createTables(tx);
                   // should really use update...
                   tx.executeSql("DELETE FROM settings WHERE key = ?", [ key ]);  
                   tx.executeSql("INSERT INTO settings VALUES(?,?)", [key, data]);
               }
               );
   } catch(error) { console.log("DB ERROR", db); }
        
}

function deleteOne(key)
{
    if(debug) console.log("Db.deleteOne(", key, ")"); // DEBUG
    
    try {    
        var db = getDB();
    
        db.transaction( function(tx) {
                       createTables(tx);
                       tx.executeSql("DELETE FROM settings WHERE key = ?", [ key ] );
                   }
               );
   } catch(error) { console.log("DB ERROR", db); }
        
}


function deleteAll()
{
    if(debug) console.log("Db.deleteAll()"); // DEBUG
    
    try { 
        var db = getDB();
    
        db.transaction( function(tx) {
                       tx.executeSql("DROP TABLE settings;");
                   }
                   );        
   } catch(error) { console.log("DB ERROR", db); }
}


