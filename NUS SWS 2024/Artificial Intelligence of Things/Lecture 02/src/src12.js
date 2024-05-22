radio.setGroup(8)
radio.setTransmitPower(7)
radio.setTransmitSerialNumber(true)

basic.showIcon(IconNames.Yes)

basic.forever(function () {
	
})

input.onButtonPressed(Button.A, function () {
    radio.sendString("ABCDEFGHIJKLMNOPQRST")
    basic.showString("TX:A")
})

input.onButtonPressed(Button.B, function () {
    radio.sendValue("ABCDEFGHI", 123)
    basic.showString("TX:B")
})

input.onButtonPressed(Button.AB, function () {
    radio.sendNumber(256)
    basic.showString("TX:AB")
})

radio.onReceivedString(function (receivedString) {
    basic.showString("RX:" + receivedString)
})

radio.onReceivedValue(function (name, value) {
    basic.showString("RX:" + name + ":" + value)
})

radio.onReceivedNumber(function (receivedNumber) {
    basic.showString("RX:" + receivedNumber)
})
