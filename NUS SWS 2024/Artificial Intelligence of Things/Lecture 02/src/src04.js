let num = 0
let str = ""

basic.forever(function () {
    num = Math.randomRange(0, 9999)
    str = "000" + num
    str = str.substr(str.length - 4, str.length)
    basic.showString("Win 4D " + str + "...")
})
