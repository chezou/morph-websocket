$(function(){
    ws = new WebSocket("ws://localhost:51234");
    ws.onmessage = function(evt) {
        $("#msg").html("<p>"+evt.data+"</p>");
    };

    ws.onclose = function() {
        console.log("closing")
    };
    ws.onopen = function() {
        ws.send("connection opend. ")
    };

    $("#input").bind('click blur keydown keyup keypress change text',function(e){
	var val = $("#input").val()
	ws.send(val)
	if( e.keyCode === 13 && e.ctrlKey){
	    $("#input").val("")
	}

    });
});
