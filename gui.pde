/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void button1_click1(GButton source, GEvent event) { //_CODE_:forwardButton:788483:
  myPort.write("w");
  println("forwardButton has been pressed @ " + millis());
} //_CODE_:forwardButton:788483:

public void button2_click1(GButton source, GEvent event) { //_CODE_:leftButton:391839:
  myPort.write("a");
  println("leftButton has been pressed @ " + millis());
} //_CODE_:leftButton:391839:

public void button1_click2(GButton source, GEvent event) { //_CODE_:rightButton:839144:
  myPort.write("d");
  println("rightButton has been pressed @ " + millis());
} //_CODE_:rightButton:839144:

public void button1_click3(GButton source, GEvent event) { //_CODE_:stopButton:868547:
  myPort.write("s");
  println("stopButton has been pressed @ " + millis());
} //_CODE_:stopButton:868547:

public void textarea1_change1(GTextArea source, GEvent event) { //_CODE_:outputTextArea:903740:
  println("textarea1 has been pressed @ " + millis());
} //_CODE_:outputTextArea:903740:

public void button1_click4(GButton source, GEvent event) { //_CODE_:endButton:361293:
  myPort.write("k");
  println("endButton has been pressed @ " + millis());
} //_CODE_:endButton:361293:

public void button1_click5(GButton source, GEvent event) { //_CODE_:reverseButton:736358:
  myPort.write("x");
  println("reverseButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:reverseButton:736358:

public void button1_click6(GButton source, GEvent event) { //_CODE_:button1:610298:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:610298:

public void button2_click2(GButton source, GEvent event) { //_CODE_:button2:502759:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button2:502759:

public void button3_click1(GButton source, GEvent event) { //_CODE_:borderDetectButton:445812:
  myPort.write("b");
  println("borderDetectButton has been pressed @ " + millis());
} //_CODE_:borderDetectButton:445812:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:444321:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button4:444321:

public void button3_click2(GButton source, GEvent event) { //_CODE_:nudgeRight:692196:
  myPort.write("e");
  println("nudgeRightButton has been pressed @ " + millis());
} //_CODE_:nudgeRight:692196:

public void button3_click3(GButton source, GEvent event) { //_CODE_:button3:626983:
  myPort.write("q");
  println("nudgeLeftButton has been pressed @ " + millis());
} //_CODE_:button3:626983:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  movementLabel = new GLabel(this, 10, 10, 80, 16);
  movementLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  movementLabel.setText("Movement");
  movementLabel.setOpaque(false);
  forwardButton = new GButton(this, 100, 10, 80, 30);
  forwardButton.setText("Forward");
  forwardButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  forwardButton.addEventHandler(this, "button1_click1");
  leftButton = new GButton(this, 10, 30, 80, 30);
  leftButton.setText("Left");
  leftButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  leftButton.addEventHandler(this, "button2_click1");
  rightButton = new GButton(this, 190, 30, 80, 30);
  rightButton.setText("Right");
  rightButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  rightButton.addEventHandler(this, "button1_click2");
  stopButton = new GButton(this, 100, 50, 80, 30);
  stopButton.setText("Stop");
  stopButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  stopButton.addEventHandler(this, "button1_click3");
  outputLabel = new GLabel(this, 10, 210, 80, 20);
  outputLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  outputLabel.setText("Output");
  outputLabel.setOpaque(false);
  outputTextArea = new GTextArea(this, 10, 230, 160, 80, G4P.SCROLLBARS_NONE);
  outputTextArea.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  outputTextArea.setOpaque(true);
  outputTextArea.addEventHandler(this, "textarea1_change1");
  endButton = new GButton(this, 390, 280, 80, 30);
  endButton.setText("End");
  endButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  endButton.addEventHandler(this, "button1_click4");
  reverseButton = new GButton(this, 100, 90, 80, 30);
  reverseButton.setText("Reverse");
  reverseButton.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  reverseButton.addEventHandler(this, "button1_click5");
  button1 = new GButton(this, 260, 120, 80, 30);
  button1.setText("Face text");
  button1.setLocalColorScheme(GCScheme.RED_SCHEME);
  button1.addEventHandler(this, "button1_click6");
  button2 = new GButton(this, 360, 120, 80, 30);
  button2.setText("Face text");
  button2.setLocalColorScheme(GCScheme.RED_SCHEME);
  button2.addEventHandler(this, "button2_click2");
  borderDetectButton = new GButton(this, 310, 80, 80, 30);
  borderDetectButton.setText("Border Detect");
  borderDetectButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  borderDetectButton.addEventHandler(this, "button3_click1");
  button4 = new GButton(this, 310, 160, 80, 30);
  button4.setText("Face text");
  button4.setLocalColorScheme(GCScheme.RED_SCHEME);
  button4.addEventHandler(this, "button4_click1");
  nudgeRight = new GButton(this, 190, 70, 80, 30);
  nudgeRight.setText("Nudge Right");
  nudgeRight.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  nudgeRight.addEventHandler(this, "button3_click2");
  button3 = new GButton(this, 10, 70, 80, 30);
  button3.setText("Nudge Left");
  button3.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  button3.addEventHandler(this, "button3_click3");
}

// Variable declarations 
// autogenerated do not edit
GLabel movementLabel; 
GButton forwardButton; 
GButton leftButton; 
GButton rightButton; 
GButton stopButton; 
GLabel outputLabel; 
GTextArea outputTextArea; 
GButton endButton; 
GButton reverseButton; 
GButton button1; 
GButton button2; 
GButton borderDetectButton; 
GButton button4; 
GButton nudgeRight; 
GButton button3; 