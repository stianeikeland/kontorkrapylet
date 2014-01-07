# Kontorkrapylet

Your friendly neighbourhood office robot.

[![Office bot](http://www.eikeland.se/other/robot3.jpg)](http://www.eikeland.se/other/robot3.mp4)
[![Office bot](http://www.eikeland.se/other/robot.png)](http://www.eikeland.se/other/robot.mp4)

## Software

### Microcontroller

UART connected microcontroller for pwm control of motors and servos.
Currently only does simple on/off on H-bridge.

### Webui

Simple webui with streaming webcam, motor control.
Nodejs with socket.io

## Hardware

### Controller

- [x] Raspberry Pi
- [x] Bypass poly fuses on raspberry pi
- [x] Atmega328 for Motor PWM and servo control.

### Motor driver

- [x] [L293D board](http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&item=200982006661&ssPageName=ADME:L:OC:GB:3160) has been ordered.

### Motors
- [ ] Motors are crap, buy new ones? Steppers? geared DC?

### Power

- [ ] 4x (or 8x) 18650 li-ion (or lifepo4 or limn)
- [ ] or RC battery pack?
- [ ] Charger?
- [ ] Holder (with protection?) [example](http://www.fasttech.com/products/0/10002230/1161600-2s2p-74v-18650-holder-with-battery-build-in-pcm-pr)
- [ ] Low battery warning [voltage buzzer](http://www.ebay.com/itm/1-8S-Lipo-Li-ion-Fe-Battery-Voltage-2IN1-Tester-Low-Voltage-Buzzer-Alarm-BY-/200988709760?pt=AU_Toys_Hobbies_Radio_Controlled_Vehicles&hash=item2ecbdc5380)
- [ ] 5v (or 3v3) step-down for raspberry pi, maybe KIS3R33S? (10k res to adj pin -> gnd for 5v)

### Webcam

- [ ] Find PI compatible webcam
- [ ] or buy a proper raspberry pi [camera board](http://www.mcmelectronics.com/product/RASPBERRY-PI-2302279-/28-17733)

Should camera be turnable or fixed?

### Scanning Range-finder

- [x] Ultrasonic range finder
- [x] Servo
- [ ] Mount

### Speaker

- [x] LM386 audio [amp](LM386 Audio Amplifier Module) (ordered)

