let rnum = 0
let remainder = 0

input.onButtonPressed(Button.A, function () {
    if (Math.randomBoolean()) {
        basic.showIcon(IconNames.Umbrella)
    } else {
        basic.showIcon(IconNames.Happy)
    }
    basic.pause(3000)
    basic.clearScreen()
    basic.showIcon(IconNames.StickFigure)
})

input.onButtonPressed(Button.B, function () {
    rnum = Math.randomRange(1, 100)
    remainder = rnum % 2
    if (remainder == 0) {
        basic.showString("" + rnum + "is even")
    } else {
        basic.showString("" + rnum + "is odd")
    }
})

input.onButtonPressed(Button.AB, function () {
    basic.clearScreen()
})
