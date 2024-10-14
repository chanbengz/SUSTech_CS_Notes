# Practice

# #1

Write your own codes and test in emulator, which sets C=1, and V=1

```asm
    .section .text
    .global _start

_start:
    LDR R0, =0x80000000
    LDR R1, =0x80000000

    //unsigned carry and signed overflow
    ADDS R0, R0, R1  // R0 = 0x80000000 + 0x80000000

loop: 
    B loop
```

# #2

Read the codes on right and answer the questions

1. Write to `RCC_APB2ENR` to enable the clock for GPIOA.
2. Write to `CRH` to configure the pins. Pin 15-9 are inputs, Pin8 is pull-up output.
3. Write to the eighth bit of `ODR` to flip the bit, likely to let the LED blink.
4. Use a loop to delay for a while, possibly $2^32 - 1$ cycles.
5. `MVN R5, #1` will set R5 to 0xFFFFFFFE.
