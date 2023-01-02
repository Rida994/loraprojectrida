# loraprojectrida
This project includes a machine learning model of keyword spotting and sending the ml results over lora network. The source files for arduino are pretrained to recognize the 10 words given below:
1) Increase Temperature
2) Decrease Temperature
3) Increase Oxygen
4) Decrease Oxygen
5) Vatican Cameos
6) PBR Status
7) Self Diagnosis
8) System Status
9) Read Logs
10) Default Settings

and 5 sentences as given below:
1) I want to have a cup of coffee
2) Can you call the police
3) Please turn on the lights
4) How is the weather out there
5) The weather seems quite sunny

The machine learning model is made of a convolutional neural network and listens from a built in microphone (In this case Nano 33 BLE Sense).
It is configured to communicate the decision results (detected sentence/keyword) over LoRa using SX1276 which can be received when the receiver code is uploaded to another arduino.
The results are then displayed on a GUI made of software processing which can be installed from https://processing.org/download.
The folder including the source code for GUI can be cloned into the sketch folder of the software and it is ready to listen to the port which communicated with the receiver node. 
