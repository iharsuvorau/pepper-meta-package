# Pepper in the medical environment (work in progress)

This is an ongoing project between [IMS Lab](https://ims.ut.ee/Intelligent_Materials%2BSystems) and Tartu Children Hospital that aims to implement remote Pepper's control via a web-based application (garlic and garlic-client). On Pepper's side, we have an Android application (tomato), which listens to the website's commands using the WebSocket protocol. The connection is established once and passes requests as they appear on the client-side.

## Architecture

![](pepper-architecture.svg)

## Web UI

Below it the UI presented for a user to provide a guided session with the robot. It is a website, which can be opened on any device in the network. 

<img width="1336" alt="web UI screenshot" src="https://user-images.githubusercontent.com/6259054/111029369-1069bc80-8405-11eb-9ffa-03eb93b748db.png">
<img width="606" alt="web UI responsive screenshot" src="https://user-images.githubusercontent.com/6259054/111029374-13fd4380-8405-11eb-91a9-3c125f9acf16.png">

## Milestones

- [x] prototype to conduct children sessions
- [x] video and web browsing features
- [x] easy to launch Windows package
- [x] import and export of sessions
- [ ] integration of [Estonian Speech Synthesizer](https://github.com/ikiissel/synthts_et) into the system
- [ ] work with multiple robots on the same network
- [ ] usage of Pepper's emotional AI
