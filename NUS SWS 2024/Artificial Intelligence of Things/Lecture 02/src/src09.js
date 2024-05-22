input.onButtonPressed(Button.A, function () {
    basic.showString("Temp=" + input.temperature())
    basic.showString("Light=" + input.lightLevel())
})

input.onButtonPressed(Button.B, function () {
    basic.showString("Compass=" + input.compassHeading())
})
