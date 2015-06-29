
COMPILER=../../PASM/pasm -b 
FILE1=PRU0toPRU1
FILE2=PRU1toPRU0


.PHONY: clean all

all:
	$(COMPILER) $(FILE1).p
	$(COMPILER) $(FILE2).p


clean: 
	rm -rf $(FILE1).bin
	rm -rf $(FILE2).bin


