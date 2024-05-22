radio.setGroup(8)
radio.setTransmitPower(7)
radio.setTransmitSerialNumber(true)

basic.showIcon(IconNames.Yes)

basic.forever(function () {
	
})

input.onButtonPressed(Button.A, function () {
    radio.sendString("Ping")
    basic.showString("TX:Ping")
})

radio.onReceivedString(function (receivedString) {
    basic.showString("RX:time:" + radio.receivedPacket(RadioPacketProperty.Time) + ", serial:" + radio.receivedPacket(RadioPacketProperty.SerialNumber) + ", signal:" + radio.receivedPacket(RadioPacketProperty.SignalStrength))
})
