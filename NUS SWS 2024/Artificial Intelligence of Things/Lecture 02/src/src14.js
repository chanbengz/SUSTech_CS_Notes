basic.forever(function () {
	
})

input.onButtonPressed(Button.A, function () {
    basic.showString("Name:" + control.deviceName())
    basic.showString(",Serial:")
    basic.showNumber(control.deviceSerialNumber())
})
