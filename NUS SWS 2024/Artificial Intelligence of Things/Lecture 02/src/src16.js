let onedarray: number[] = []
let swop: boolean
let temp: number

onedarray = [5, 4, 3, 2, 1]
swop = true
temp = 0

basic.forever(function () {
	
})

input.onButtonPressed(Button.A, function () {
    for (let num of onedarray) {
        basic.showNumber(num)
    }
    basic.showIcon(IconNames.SmallDiamond)
    while (swop) {
        swop = false
        for (let i = 0; i <= onedarray.length - 1 - 1; i++) {
            if (onedarray[i] > onedarray[i + 1]) {
                temp = onedarray[i]
                onedarray[i] = onedarray[i + 1]
                onedarray[i + 1] = temp
                swop = true
            }
        }
    }
    for (let num2 of onedarray) {
        basic.showNumber(num2)
    }
})
