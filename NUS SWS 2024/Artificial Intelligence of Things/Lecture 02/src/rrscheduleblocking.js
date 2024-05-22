let count = 0
let startTime = 0

basic.forever(function () {
    basic.showNumber(count)
})

input.onButtonPressed(Button.A, function () {
    count += 1
})

input.onButtonPressed(Button.B, function () {
    startTime = input.runningTime()
    while (true) {
        if (input.runningTime() - startTime >= 10000) {
            break;
        }
    }
})
