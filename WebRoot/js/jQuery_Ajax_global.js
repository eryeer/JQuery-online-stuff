$(document)
.ajaxSend(function(){
	console.log("begin to send");
})
.ajaxStart(function(){
	console.log("start");
})
.ajaxError(function(){
	console.log("error occurs");
})
.ajaxSuccess(function(){
	console.log("Receive success");
})
.ajaxComplete(function(){
	console.log("complete");
})
.ajaxStop(function(){
	console.log("Stopped");
})