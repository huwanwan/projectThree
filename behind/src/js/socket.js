var io = require('socket.io')();

io.on('connection', function(socket){

});
io.listen(90, function(){
    console.log('开启成功');
})