let counter = 0

counter = 0

basic.forever(function () {
    basic.showNumber(counter)
})

input.onButtonPressed(Button.A, function () {
    counter = counter + 1
})

input.onButtonPressed(Button.B, function () {
    counter = counter - 1
})

input.onButtonPressed(Button.AB, function () {
    counter = 0
})

input.onGesture(Gesture.Shake, function () {
    counter = counter * 10
})