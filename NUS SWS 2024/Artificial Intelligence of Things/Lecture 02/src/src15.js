radio.setGroup(8)
radio.setTransmitPower(7)
radio.setTransmitSerialNumber(true)

basic.showIcon(IconNames.Yes)

basic.forever(function () {
	
})

input.onButtonPressed(Button.A, function () {
    basic.showString("Serial:")
    basic.showNumber(control.deviceSerialNumber())
    basic.showIcon(IconNames.Yes)
})

input.onGesture(Gesture.ScreenUp, function () {
    radio.sendValue("lightSwi", 1)
    basic.showIcon(IconNames.Happy)
})

input.onGesture(Gesture.ScreenDown, function () {
    radio.sendValue("lightSwi", 0)
    basic.showIcon(IconNames.Sad)
})

radio.onReceivedValue(function (name, value) {
    if (radio.receivedPacket(RadioPacketProperty.SerialNumber) == -86594252) {
        if (name == "lightSwi") {
            if (value == 1) {
                basic.showLeds(`
                    # # # # #
                    # # # # #
                    # # # # #
                    # # # # #
                    # # # # #
                    `)
            } else {
                basic.clearScreen()
            }
        }
    }
})
