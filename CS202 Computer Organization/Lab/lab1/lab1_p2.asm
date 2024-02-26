.data                  # data* is 4bytes, its initial value is 0   
    buf: .word 0x0000

.text                  # instructions  
main:                  # in the   ‘tailored General purpose processor’, the value in register x31 is 0xFFC0.
            
    lw   x1, 8(x31)    # copy data from 0xFFC8(switch) to register x1
    sw  x1, 4(x31)     # copy data from register x1 to 0xFFC4(led)
    j main             # jump to the instructions labled by main
