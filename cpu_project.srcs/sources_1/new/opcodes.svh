`ifndef OPCODES_SVH
`define OPCODES_SVH

`include "types.svh"

// The following function codes all go with the 
// "opcode" ALUFN ('b000000). They are basically
// the "register encoding" operations.
typedef enum logic6 {
    SLL     = 'b000000,     //  0
    SRL     = 'b000010,     //  2
    SRA     = 'b000011,     //  3
    SLLV    = 'b000100,     //  4
    SRLV    = 'b000110,     //  6
    SRAV    = 'b000111,     //  7
    JR      = 'b001000,     //  8
    JALR    = 'b001001,     //  9
    MFHI    = 'b010000,     // 16
    MTHI    = 'b010001,     // 17
    MFLO    = 'b010010,     // 18
    MTLO    = 'b010011,     // 19
    MULT    = 'b011000,     // 24
    MULTU   = 'b011001,     // 25
    DIV     = 'b011010,     // 26
    DIVU    = 'b011011,     // 27
    ADD     = 'b100000,     // 32
    ADDU    = 'b100001,     // 33
    SUB     = 'b100010,     // 34
    SUBU    = 'b100011,     // 35
    AND     = 'b100100,     // 36
    OR      = 'b100101,     // 37
    XOR     = 'b100110,     // 38
    NOR     = 'b100111,     // 39
    SLTU    = 'b101001,     // 41
    SLT     = 'b101010      // 42
} function_t;

typedef enum logic5 {
    CTRL_SLL     = 'b00000,
    CTRL_SRL     = 'b00010,
    CTRL_SRA     = 'b00011,
    CTRL_SLLV    = 'b00100,
    CTRL_SRLV    = 'b00110,
    CTRL_SRAV    = 'b00111,
    CTRL_ADDI    = 'b01000,
    CTRL_ADDIU   = 'b01001,
    CTRL_SLTI    = 'b01010,
    CTRL_SLTIU   = 'b01011,
    CTRL_ANDI    = 'b01100,
    CTRL_ORI     = 'b01101,
    CTRL_XORI    = 'b01110,
    CTRL_ADD     = 'b10000,
    CTRL_ADDU    = 'b10001,
    CTRL_SUB     = 'b10010,
    CTRL_SUBU    = 'b10011,
    CTRL_AND     = 'b10100,
    CTRL_OR      = 'b10101,
    CTRL_XOR     = 'b10110,
    CTRL_SLTU    = 'b11001,
    CTRL_SLT     = 'b11010
} alu_ctrl_t;

// Opcodes for the Immediate (I) encoding
// and the Jump (J) encoding.
typedef enum logic6 {
    ALUFN   = 'b000000,     //  0 - see function_t above
    J       = 'b000010,     //  2
    JAL     = 'b000011,     //  3
    BEQ     = 'b000100,     //  4
    BNE     = 'b000101,     //  5
    BLEZ    = 'b000110,     //  6
    BGTZ    = 'b000111,     //  7
    ADDI    = 'b001000,     //  8
    SLTI    = 'b001010,     // 10
    SLTIU   = 'b001011,     // 11
    ANDI    = 'b001100,     // 12
    ORI     = 'b001101,     // 13
    XORI    = 'b001110,     // 14
    LLO     = 'b011000,     // 24
    LHI     = 'b011001,     // 25
    TRAP    = 'b011010,     // 26
    LB      = 'b100000,     // 32
    LH      = 'b100001,     // 33
    LW      = 'b100011,     // 35
    LBU     = 'b100100,     // 36
    LHU     = 'b100101,     // 37
    SB      = 'b101000,     // 40
    SH      = 'b101001,     // 41
    SW      = 'b101011      // 43
} opcode_t;

`endif // OPCODES_SVH
