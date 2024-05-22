let j = 0
let nums: number[] = []

nums = [7, 8, 9]

input.onButtonPressed(Button.A, function () {
    for (let index = 0; index < 3; index++) {
        flashHeart()
    }
    wait()
    while (j < 3) {
        flashHeart()
        j += 1
    }
    wait()
    for (let num of nums) {
        flashNum(num)
    }
    wait()
})

function flashNum (anum: number) {
    basic.showNumber(anum)
    basic.pause(250)
    basic.clearScreen()
    basic.pause(250)
}

function flashHeart () {
    basic.showIcon(IconNames.Heart)
    basic.pause(250)
    basic.clearScreen()
    basic.pause(250)
}

function wait () {
    basic.showLeds(`
        . . . . .
        . . . . .
        # # # # #
        . . . . .
        . . . . .
        `)
    basic.pause(250)
    basic.clearScreen()
    basic.pause(250)
}
