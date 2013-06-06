
var board;

var Board = function(canvas_, window_) {
    var comp_block = Qt.createComponent("components/Block.qml");
    var comp_block_particle = Qt.createComponent("components/BlockParticle.qml");
    var canvas = canvas_;
    var window = window_;
    
    if (comp_block.status != Component.Ready) {
        console.log("INTERNAL ERROR: component not ready", comp_block.errorString());
    }
    if (comp_block_particle.status != Component.Ready) {
        console.log("INTERNAL ERROR: component not ready", comp_block_particle.errorString());
    }
    
    // --------------------------------------------
    
    this.addOne = function()
    {
        var type = Math.floor(4 * Math.random());
        var x0 = canvas.width / 2 - (Math.random() - 0.5) * canvas.width * 0.9
        var x2 = canvas.width / 2 - Math.random() * canvas.width / 3 
        var x1 = (x0 + x2) / 2
        
        var y0 = canvas.height * ( 1.2 + Math.random() * 0.2)
        var y2 = y0;
        var y1 = canvas.height * Math.random() / 2
        
        var obj = comp_block.createObject(canvas, { "type" : type} );
        obj.init(x0, y0, x1, y1, x2, y2);
        
    }
    
    this.hit = function(block)
    {
        var part = comp_block_particle.createObject(window );        
        part.position(block);
    }
    
    
};
