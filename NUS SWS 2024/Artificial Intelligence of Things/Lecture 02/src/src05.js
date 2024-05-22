input.onButtonPressed(Button.A, function () {
    basic.showString("A")
})

input.onButtonPressed(Button.B, function () {
    basic.showString("B")
})

input.onButtonPressed(Button.AB, function () {
    basic.showString("A+B")
})

input.onGesture(Gesture.ScreenUp, function () {
    basic.showString("SU")
})

input.onGesture(Gesture.ScreenDown, function () {
    basic.showString("SD")
})

input.onGesture(Gesture.LogoUp, function () {
    basic.showString("LU")
})

input.onGesture(Gesture.LogoDown, function () {
    basic.showString("LD")
})

input.onGesture(Gesture.TiltLeft, function () {
    basic.showString("TL")
})

input.onGesture(Gesture.TiltRight, function () {
    basic.showString("TR")
})

input.onGesture(Gesture.Shake, function () {
    basic.showString("S")
})

input.onGesture(Gesture.FreeFall, function () {
    basic.showString("FF")
})

input.onGesture(Gesture.ThreeG, function () {
    basic.showString("3G")
})

input.onGesture(Gesture.SixG, function () {
    basic.showString("6G")
})

input.onGesture(Gesture.EightG, function () {
    basic.showString("8G")
})
