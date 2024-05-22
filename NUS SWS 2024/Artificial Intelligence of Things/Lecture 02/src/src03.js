let num = 0

basic.forever(function () {
    num = Math.randomRange(0, 9999)
    basic.showString("Win 4D ")
    basic.showNumber(num)
    basic.showString("...")
})
