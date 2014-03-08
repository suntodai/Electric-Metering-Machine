
An embedded system design. (1) Design the AD controller IP, write the driver, (2) Build the SOPC system on Quatus II.
Input signals are connected to the plug of the machine, ADC acquires the data and converts it into the digital singal, FPGA receives the signal from the ADC and outputs the analyzing results to the LCD display. A NiosII-32 processor is built on FPGA, which runs the software controls the machine operations such as initialization, analyzing, display.

Newly written IP cores are in folder IP_CORE
C code for the embedded system is in folder C-program-on-NiosII-CPU/final_test
