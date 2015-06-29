from __future__ import print_function

import pypruss
import os

#on PRU0
# wait for input on PRU0 to go high.
# when it goes high, send interrupt to PRU1.

#on PRU1
# wait for interrupt from PRU0
# generate square wave

pypruss.modprobe()

pypruss.init()                                      # Init the PRU

pypruss.open(0)                                     # Open PRU event 0 which is PRU0_ARM_INTERRUPT
pypruss.open(1)                                     # also PRU1

pypruss.pruintc_init()

pypruss.exec_program(0, "./PRU0toPRU1.bin")
pypruss.exec_program(1, "./PRU1toPRU0.bin")

pypruss.wait_for_event(0)                   # wait for an interrupt from PRU0. currently not sent, use CtrlC       
