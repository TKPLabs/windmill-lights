server.log("Agent Started");

local state = 0;


function httpHandler(req, resp) {
    server.log("Got a request");
    resp.header("Access-Control-Allow-Origin", "*"); 
    resp.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    resp.header("Access-Control-Allow-Methods", "POST, PUT, GET, OPTIONS");
    if ("state" in req.query) {
        server.log("state: " + req.query["state"]);
        state = req.query["state"].tointeger();
        device.send("set-lights", state);
    }
    
    resp.send(200, "{\"state\": " + state + "}");
}

http.onrequest(httpHandler);
