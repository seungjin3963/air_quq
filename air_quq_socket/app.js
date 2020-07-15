//const http = require('https');
//const os = require('os');
//const socketIO = require('socket.io');
//const nodeStatic = require('node-static');
//const fs = require('fs');
//
//const options = {
//	key: fs.readFileSync('keys/private.pem'),
//	cert: fs.readFileSync('keys/public.pem')
//};
//
//let fileServer = new(nodeStatic.Server)();
//let app = http.createServer(options,(req,res)=>{
//    fileServer.serve(req,res);
//}).listen(3000);
//
//let io = socketIO.listen(app);
//io.sockets.on('connection',socket=>{
//    function log() {
//        let array = ['Message from server:'];
//        array.push.apply(array,arguments);
//        socket.emit('log',array);
//    }
//
//    socket.on('message',message=>{
//        log('Client said : ' ,message);
//        socket.broadcast.emit('message',message);
//    });
//
//    socket.on('create or join',room=>{
//        let clientsInRoom = io.sockets.adapter.rooms[room];
//        let numClients = clientsInRoom ? Object.keys(clientsInRoom.sockets).length : 0;
//        log('Room ' + room + ' now has ' + numClients + ' client(s)');
//        
////        if(numClients === 0){
////            console.log('create room!');
////            socket.join(room);
////            log('Client ID ' + socket.id + ' created room ' + room);
////            socket.emit('created',room,socket.id);
////        }
////        else if(numClients===1){
////            console.log('join room!');
////            log('Client Id' + socket.id + 'joined room' + room);
////            io.sockets.in(room).emit('join',room);
////            socket.join(room);
////            socket.emit('joined',room,socket.id);
////            io.sockets.in(room).emit('ready');
////        }else{
////            socket.emit('full',room);
////        }
//        if(numClients === 0){
//            console.log('create room!');
//            socket.join(room);
//            log('Client ID ' + socket.id + ' created room ' + room);
//            socket.emit('created',room,socket.id);
//        }
//        else{
//            console.log('join room!');
//            log('Client Id' + socket.id + 'joined room' + room);
//            io.sockets.in(room).emit('join',room);
//            socket.join(room);
//            socket.emit('joined',room,socket.id);
//            io.sockets.in(room).emit('ready');
//        }
//    });
//});


const http = require('https');
const os = require('os');
const socketIO = require('socket.io');
const nodeStatic = require('node-static');
const fs = require('fs');

const options = {
	key: fs.readFileSync('keys/private.pem'),
	cert: fs.readFileSync('keys/public.pem')
};

let fileServer = new(nodeStatic.Server)();
let app = http.createServer(options,(req,res)=>{
    fileServer.serve(req,res);
}).listen(3000);

let io = socketIO.listen(app);

io.on('connection', function(socket){
	io.sockets.emit("user-joined", socket.id, io.engine.clientsCount, Object.keys(io.sockets.clients().sockets));

	socket.on('signal', (toId, message) => {
		io.to(toId).emit('signal', socket.id, message);
	});

  socket.on("message", function(data){
		io.sockets.emit("broadcast-message", socket.id, data);
  })

	socket.on('disconnect', function() {
		io.sockets.emit("user-left", socket.id);
	})
});
