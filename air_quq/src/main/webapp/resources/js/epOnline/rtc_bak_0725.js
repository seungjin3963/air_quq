"use strict";

let localVideo = document.getElementById("localVideo");
let isInitiator = false;
let isChannelReady = false;
let isStarted = false;
let localStream;
let pc;

let pcConfig = {
		'iceServers': [
		    {
		      'urls': 'stun:stun.l.google.com:19302'
		    },
		    {
		      'urls': 'turn:192.158.29.39:3478?transport=udp',
		      'credential': 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
		      'username': '28224511:1379330808'
		    },
		    {
		      'urls': 'turn:192.158.29.39:3478?transport=tcp',
		      'credential': 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
		      'username': '28224511:1379330808'
		    }
		  ]
}

/* let room = 'foo'; */
let room = $('#einum').val();

let socket = io.connect("https://localhost:3000/", {secure: true});
/* let socket = io.connect("https://192.168.0.2:3000/", {secure: true}); */

if(room !==''){
  socket.emit('create or join',room);
  console.log('Attempted to create or join Room',room);
}

socket.on('created', (room,id)=>{
  console.log('Created room' + room+'socket ID : '+id);
  isInitiator= true;
})

socket.on('full', room=>{
  console.log('Room '+room+'is full');
});

socket.on('join',room=>{
  console.log('Another peer made a request to join room' + room);
  console.log('This peer is the initiator of room' + room + '!');
  isChannelReady = true;
})

socket.on('joined',room=>{
  console.log('joined : '+ room );
  isChannelReady= true;
})

socket.on('log', array=>{
  console.log.apply(console,array);
});

socket.on('message', (message)=>{
  console.log('Client received message :',message);
  if(message === 'got user media'){
    maybeStart();
  }else if(message.type === 'offer'){
	  if(!isInitiator && !isStarted){
		  maybeStart();
	  }
    pc.setRemoteDescription(new RTCSessionDescription(message));
    doAnswer();
  }else if(message.type ==='answer' && isStarted){
    pc.setRemoteDescription(new RTCSessionDescription(message));
  }else if(message.type ==='candidate' &&isStarted){
    const candidate = new RTCIceCandidate({
      sdpMLineIndex : message.label,
      candidate:message.candidate
    });

    pc.addIceCandidate(candidate);
  }
})

function sendMessage(message){
  console.log('Client sending message: ',message);
  socket.emit('message',message);
}

navigator.mediaDevices
  .getUserMedia({
    video: true,
    audio: false,
  })
  .then(gotStream)
  .catch((error) => console.error(error));

function gotStream(stream) {
  console.log("Adding local stream");
  localStream = stream;
  localVideo.srcObject = stream;
  sendMessage("got user media");
  if (isInitiator) {
    maybeStart();
  }
}

function createPeerConnection() {
  try {
    pc = new RTCPeerConnection(null);
    pc.onicecandidate = handleIceCandidate;
    pc.onaddstream = handleRemoteStreamAdded;
    console.log("Created RTCPeerConnection");
  } catch (e) {
    alert("connot create RTCPeerConnection object");
    return;
  }
}

function handleIceCandidate(event) {
  console.log("iceCandidateEvent", event);
  if (event.candidate) {
    sendMessage({
      type: "candidate",
      label: event.candidate.sdpMLineIndex,
      id: event.candidate.sdpMid,
      candidate: event.candidate.candidate,
    });
  } else {
    console.log("end of candidates");
  }
}

function handleCreateOfferError(event) {
  console.log("createOffer() error: ", event);
}

function handleRemoteStreamAdded(event) {
	console.log("asdfasdfasdf");
	// console.log("remote stream added");
	// remoteStream = event.stream;
	// remoteVideo.srcObject = remoteStream;
	  
	var video  = document.createElement('video'),
	div    = document.createElement('div');
	
	// video.setAttribute('data-socket', id);
	// video.src = window.URL.createObjectURL(event.stream);
	video.srcObject   = event.stream;
	video.autoplay    = true; 
	video.muted       = true;
	video.playsinline = true;
	
	// div.appendChild(video);
	// document.querySelector('.remoteContainer').appendChild(div);
	document.querySelector('.remoteContainer').appendChild(video);
}

function maybeStart() {
  console.log(">>MaybeStart() : ", isStarted, localStream, isChannelReady);
	 if (!isStarted && typeof localStream !== "undefined" && isChannelReady) {
	 console.log(">>>>> creating peer connection");
	 createPeerConnection();
	 pc.addStream(localStream);
	 isStarted = true;
	 console.log("isInitiator : ", isInitiator);
	 if (isInitiator) {
	 doCall();
	 }
	 }else{
	 console.error('maybeStart not Started!');
	 }
}

function doCall() {
  console.log("Sending offer to peer");
  pc.createOffer(setLocalAndSendMessage, handleCreateOfferError);
}

function doAnswer() {
  console.log("Sending answer to peer");
  pc.createAnswer().then(
    setLocalAndSendMessage,
    onCreateSessionDescriptionError
  );
}

function setLocalAndSendMessage(sessionDescription) {
  pc.setLocalDescription(sessionDescription);
  sendMessage(sessionDescription);
}

function onCreateSessionDescriptionError(error) {
  console.error("Falied to create session Description", error);
}