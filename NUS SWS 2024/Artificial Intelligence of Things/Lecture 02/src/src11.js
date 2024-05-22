radio.setGroup(8)
radio.setTransmitPower(7)
radio.setTransmitSerialNumber(true)
basic.showIcon(IconNames.Yes)

basic.forever(function () {
	
})

input.onButtonPressed(Button.A, function () {
    radio.sendString("A")
    basic.showString("TX:A")
})

input.onButtonPressed(Button.B, function () {
    radio.sendString("B")
    basic.showString("TX:B")
})

input.onButtonPressed(Button.AB, function () {
    radio.sendString("AB")
    basic.showString("TX:AB")
})

radio.onReceivedString(function (receivedString) {
    basic.showString("RX:" + receivedString)
})
