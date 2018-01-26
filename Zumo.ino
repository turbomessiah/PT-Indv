#include <NewPing.h>
#include <ZumoMotors.h>
#include <Servo.h>
#include <QTRSensors.h>
#include <ZumoReflectanceSensorArray.h>
#include <ZumoBuzzer.h>
#include <Pushbutton.h>

char val; // Data received from the serial port
int ledPin = 13; // Set the pin to digital I/O 13
boolean ledState = LOW;

#define QTR_THRESHOLD  250 // microseconds

#define REVERSE_SPEED 200
#define TURN_SPEED 200
#define FORWARD_SPEED 400
#define REVERSE_DURATION 200
#define TURN_DURATION 300

#define TRIGGER_PIN  12  // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN     11  // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 200 // Maximum distance we want to ping for (in centimeters). Maximum sensor distance is rated at 400-500cm.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.


ZumoBuzzer buzzer;
ZumoReflectanceSensorArray reflectanceSensors;
ZumoMotors motors;
Pushbutton button(ZUMO_BUTTON);

#define NUM_SENSORS 6
unsigned int sensor_values[NUM_SENSORS];
ZumoReflectanceSensorArray sensors(QTR_NO_EMITTER_PIN);

void setup() {
  // put your setup code here, to run once:
  //motors.flipLeftMotor(true);
  //motors.flipRightMotor(true);
  
  pinMode(ledPin, OUTPUT); // Set pin as OUTPUT
  reflectanceSensors.init();
  Serial.begin(9600);
  establishContact();
  reflectanceSensors.calibrate();
}

void loop()
{
  if (Serial.available() > 0) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
    Servo movingServo;
    
    
    if(val == 'w') //if we get a w
    {
      motors.setLeftSpeed(1000); motors.setRightSpeed(1000); delay(2);
    }
    if(val == 's') //if we get a s
    {
      motors.setLeftSpeed(0); motors.setRightSpeed(0); delay(2);
    }
    if(val == 'd') //if we get a d
    {
      motors.setLeftSpeed(1000); motors.setRightSpeed(0); delay(2);
    }
    if(val == 'a') //if we get an a
    {
      motors.setLeftSpeed(0); motors.setRightSpeed(1000); delay(2);
    }
    if(val == 'x') //if we get a x
    {
      motors.setLeftSpeed(-1000); motors.setRightSpeed(-1000); delay(2); 
    }
    if(val == 'b') //if we get a b
    {
      while(true)
      {
        
        if (val == 's')
        {
          motors.setLeftSpeed(0); motors.setRightSpeed(0); delay(2);
          break;
        }
        sensors.read(sensor_values);
        Serial.println(String (sensor_values[0]));
        Serial.println(String (sensor_values[5]));
  
        if (sensor_values[0] > QTR_THRESHOLD)
        {
          // if leftmost sensor detects line, reverse and turn to the right
          motors.setSpeeds(-REVERSE_SPEED, -REVERSE_SPEED);
          delay(REVERSE_DURATION);
          motors.setSpeeds(TURN_SPEED, -TURN_SPEED);
          delay(TURN_DURATION);
          motors.setSpeeds(FORWARD_SPEED, FORWARD_SPEED);
        }
        else if (sensor_values[5] > QTR_THRESHOLD)
        {
          // if rightmost sensor detects line, reverse and turn to the left
          motors.setSpeeds(-REVERSE_SPEED, -REVERSE_SPEED);
          delay(REVERSE_DURATION);
          motors.setSpeeds(-TURN_SPEED, TURN_SPEED);
          delay(TURN_DURATION);
          motors.setSpeeds(FORWARD_SPEED, FORWARD_SPEED);
        }
        else
        {
          // otherwise, go straight
          motors.setSpeeds(FORWARD_SPEED, FORWARD_SPEED);
        }
      }
    }
    // if sensor 0 and 5 are above the threshold then say it has reached a corner..
    if(val == 'k') //if we get a k
    {
      //end function here
    }
    if(val == 'e') //if we get an e
    {
      //nudge right function here
      motors.setLeftSpeed(1000);
      delay(TURN_DURATION);
      motors.setLeftSpeed(0);
    }
    if(val == 'q') //if we get a q
    {
      //nudge left function here
      motors.setRightSpeed(1000);
      delay(TURN_DURATION);
      motors.setRightSpeed(0);
    }
    delay(100);
  } 
//    else {
//    Serial.println("Hello, world!"); //send back a hello world
//    delay(50);
//    }
}

void establishContact() {
  while (Serial.available() <= 0) {
  Serial.println("A");   // send a capital A
  delay(300);
  }
}
