EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:hackrf
LIBS:FSDR_lib
LIBS:FSDR-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MAX19707 U?
U 1 1 583263E0
P 3575 3050
F 0 "U?" H 2675 3850 50  0000 L CNN
F 1 "MAX19707" H 3100 3050 118 0000 L CNN
F 2 "MODULE" H 3575 3050 50  0001 C CNN
F 3 "DOCUMENTATION" H 3575 3050 50  0001 C CNN
	1    3575 3050
	1    0    0    -1  
$EndComp
$Comp
L R_PACK4 RP?
U 1 1 5835539E
P 5375 2450
F 0 "RP?" H 5375 2400 50  0000 C CNN
F 1 "100R" H 5375 2900 50  0000 C CNN
F 2 "" H 5375 2450 50  0000 C CNN
F 3 "" H 5375 2450 50  0000 C CNN
	1    5375 2450
	-1   0    0    1   
$EndComp
$Comp
L R_PACK4 RP?
U 1 1 5835565A
P 5375 3050
F 0 "RP?" H 5375 3000 50  0000 C CNN
F 1 "100R" H 5375 3500 50  0000 C CNN
F 2 "" H 5375 3050 50  0000 C CNN
F 3 "" H 5375 3050 50  0000 C CNN
	1    5375 3050
	-1   0    0    1   
$EndComp
$Comp
L R_PACK4 RP?
U 1 1 5835569A
P 5375 3650
F 0 "RP?" H 5375 3600 50  0000 C CNN
F 1 "100R" H 5375 4100 50  0000 C CNN
F 2 "" H 5375 3650 50  0000 C CNN
F 3 "" H 5375 3650 50  0000 C CNN
	1    5375 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5175 2500 4775 2500
Wire Wire Line
	4775 2600 5175 2600
Wire Wire Line
	5175 2700 4775 2700
Wire Wire Line
	4775 2800 5175 2800
Wire Wire Line
	5175 3100 4775 3100
Wire Wire Line
	4775 3200 5175 3200
Wire Wire Line
	5175 3300 4775 3300
Wire Wire Line
	4775 3400 5175 3400
Wire Wire Line
	5175 3700 5000 3700
Wire Wire Line
	5000 3700 5000 3500
Wire Wire Line
	5000 3500 4775 3500
Wire Wire Line
	4925 3600 4925 3800
Wire Wire Line
	4925 3800 5175 3800
Wire Wire Line
	4925 3600 4775 3600
NoConn ~ 5175 3900
NoConn ~ 5175 4000
NoConn ~ 5575 3900
NoConn ~ 5575 4000
Text GLabel 5575 3800 2    47   BiDi ~ 0
AD0
Text GLabel 5575 3700 2    47   BiDi ~ 0
AD1
Text GLabel 5575 3400 2    47   BiDi ~ 0
AD2
Text GLabel 5575 3300 2    47   BiDi ~ 0
AD3
Text GLabel 5575 3200 2    47   BiDi ~ 0
AD4
Text GLabel 5575 3100 2    47   BiDi ~ 0
AD5
Text GLabel 5575 2800 2    47   BiDi ~ 0
AD6
Text GLabel 5575 2700 2    47   BiDi ~ 0
AD7
Text GLabel 5575 2600 2    47   BiDi ~ 0
AD8
Text GLabel 5575 2500 2    47   BiDi ~ 0
AD9
$EndSCHEMATC
