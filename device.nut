server.log("Device Started");

lights <- hardware.pin1;
lights.configure(DIGITAL_OUT)

function setLightsHandler(state) {
    server.log("Got a setlights message from the agent");
    lights.write(state);
}

agent.on("set-lights", setLightsHandler);
