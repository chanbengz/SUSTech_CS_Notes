let count = 0

basic.forever(function () {
    basic.showNumber(count)
})

input.onButtonPressed(Button.A, function () {
    count += 1
})
