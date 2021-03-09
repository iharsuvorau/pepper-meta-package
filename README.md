# Pepper in the medical environment (work in progress)

This is an ongoing project between [IMS Lab](https://ims.ut.ee/Intelligent_Materials%2BSystems) and Tartu Children Hospital that aims to implement remote Pepper's control via a web-based application (garlic and garlic-client). On Pepper's side, we have an Android application (tomato), which listens to the website's commands using the WebSocket protocol. The connection is established once and passes requests as they appear on the client-side.

## Architecture

![](pepper-architecture.svg)
