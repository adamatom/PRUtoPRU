.origin 0
.entrypoint START

#define PRU0_PRU1_INTERRUPT     17
#define PRU1_PRU0_INTERRUPT     18
#define PRU0_ARM_INTERRUPT      19

#define GPIO1 				0x4804c000		// The adress of the GPIO1 
#define GPIO_CLEARDATAOUT 	0x190
#define GPIO_SETDATAOUT 	0x194

START:
    LBCO r0, C4, 4, 4					// Load Bytes Constant Offset (?)
    CLR  r0, r0, 4						// Clear bit 4 in reg 0
    SBCO r0, C4, 4, 4					// Store Bytes Constant Offset

    WBS r31.t15      //wait for input bit

    MOV r31.b0, PRU0_PRU1_INTERRUPT+16    // wake up PRU1

    MOV r1, 10000
BLINK:
    MOV r2, 7<<22
    MOV r3, GPIO1 | GPIO_SETDATAOUT
    SBBO r2, r3, 0, 4

    MOV r0, 0x00a00000
DELAY:
    SUB r0, r0, 1
    QBNE DELAY, r0, 0

    MOV r2, 7<<22
    MOV r3, GPIO1 | GPIO_CLEARDATAOUT
    SBBO r2, r3, 0, 4

    MOV r0, 0x00a00000
DELAY2:
    SUB r0, r0, 1
    QBNE DELAY2, r0, 0
    SUB r1, r1, 1
    QBNE BLINK, r1, 0
HALT
