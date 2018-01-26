import processing.serial.*;
import g4p_controls.*;

Serial myPort;  //the Serial port object
String val;
// since we're doing serial handshaking, 
// we need to check if we've heard from the microcontroller
boolean firstContact = false;


public void setup(){
  size(480, 320, JAVA2D);
  createGUI();
  //customGUI();
  // Place your setup code here
  myPort = new Serial(this, "COM3", 9600);
  myPort.bufferUntil('\n');
}

public void draw(){
  background(230);
  //if (mousePressed == true) 
  //{                           //if we clicked in the window
  // myPort.write('1');         //send a 1
  // println("1");   
  //} else 
  //{                           //otherwise
  //myPort.write('0');          //send a 0
  //}
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

void serialEvent( Serial myPort) {
//put the incoming data into a String - 
//the '\n' is our end delimiter indicating the end of a complete packet
val = myPort.readStringUntil('\n');
//make sure our data isn't empty before continuing
if (val != null) {
  //trim whitespace and formatting characters (like carriage return)
  val = trim(val);
  println(val);

  //look for our 'A' string to start the handshake
  //if it's there, clear the buffer, and send a request for data
  if (firstContact == false) {
    if (val.equals("A")) {
      myPort.clear();
      firstContact = true;
      myPort.write("A");
      println("Contact Made!");
    }
  }
  else { //if we've already established contact, keep getting and parsing data
    println(val);

    if (mousePressed == true) 
    {                           //if we clicked in the window
      myPort.write('1');        //send a 1
      println("1");
    }

    // when you've parsed the data you have, ask for more:
    //myPort.write("A");
    }
  }
}