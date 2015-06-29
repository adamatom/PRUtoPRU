.origin 0
.entrypoint START

#define PRU0_PRU1_INTERRUPT     17
#define PRU1_PRU0_INTERRUPT     18
#define PRU0_ARM_INTERRUPT      19

START:
    WBS r31, 31


BLINK:
    MOV r30, 1<<8 // up level
    MOV r2, 1998
UP:
    SUB r2, r2, 1
    QBNE UP, r2, 0 

    MOV r30, 0  // down level

    MOV r2, 1997
DOWN:
    SUB r2, r2, 1
    QBNE DOWN, r2, 0
    QBA BLINK
