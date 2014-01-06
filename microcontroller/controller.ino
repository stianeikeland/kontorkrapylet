
#define AUTOSTOP_INTERVAL 1000

#define FORWARD 'F'
#define BACKWARD 'B'
#define LEFT 'L'
#define RIGHT 'R'
#define STOP 'S'

int motor_left[] = {2, 3};
int motor_right[] = {7, 8};

volatile char direction = STOP;
volatile unsigned long lastEvent;

void setup() {
	int i;

	Serial.begin(57600);

	for(i=0; i<2; i++) {
	    pinMode(motor_left[i], OUTPUT);
	    pinMode(motor_right[i], OUTPUT);
	}

	stop();
}

void motorStop(int* motor) {
	digitalWrite(motor[0], LOW);
	digitalWrite(motor[1], LOW);
}

void motorForward(int* motor) {
	digitalWrite(motor[0], HIGH);
	digitalWrite(motor[1], LOW);
}

void motorBackward(int* motor) {
	digitalWrite(motor[0], LOW);
	digitalWrite(motor[1], HIGH);
}

void forward() {
	motorForward(motor_left);
	motorForward(motor_right);
}

void backward() {
	motorBackward(motor_left);
	motorBackward(motor_right);
}

void turnLeft() {
	motorStop(motor_left);
	motorForward(motor_right);
}

void turnRight() {
	motorForward(motor_left);
	motorStop(motor_right);
}

void stop() {
	motorStop(motor_left);
	motorStop(motor_right);
}

void serialEvent() {
	char input;

	while (Serial.available()) {
		input = (char)Serial.read();
		direction = input;
		lastEvent = millis();
	}
}

void loop() {

	// Stop if it's been too long since last event.
	if (millis() - lastEvent > AUTOSTOP_INTERVAL)
		direction = STOP;

	switch (direction) {
	    case FORWARD: forward(); break;
	    case BACKWARD: backward(); break;
	    case LEFT: turnLeft(); break;
	    case RIGHT: turnRight(); break;
	    case STOP:
	    default: stop();
	}

}
