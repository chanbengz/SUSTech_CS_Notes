| name        | from       | to         | bits | function                                                 |
| ----------- | ---------- | ---------- | ---- | -------------------------------------------------------- |
| regWrite    | Controller | Decoder    | 1    | 1 means write the register identified by writeAdress     |
| imm32       | Decoder    | IFetch/ALU | 32   | the signextended immediate                               |
| instruction | IFetch     | Decoder    | 32   | the instruction                                          |
| rdata1      | Decoder    | ALU        | 32   | the data read from the register which is specifiedby rs1 |
| rdata2      | Decoder    | ALU        | 32   | the data read from the register which is specifiedby rs2 |
| wdata       | Memory     | Decoder    | 32   | the data written by the memory which is specifiedby rd   |