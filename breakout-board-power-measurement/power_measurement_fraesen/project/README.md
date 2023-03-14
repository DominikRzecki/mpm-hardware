# breakout board power measurement

- supply voltage 3.3V
- MCP3911
- optocoupler required

Due to large currents, the voltage drops along wires can't be neglected any more.
Thus alll relevant connections, should be kept as short as possible.

- MCP3911 
    - features 
        - inbuilt amplifier with an maximum gain of 32V/V
        - SPI interface
        - 2x 24 Bit differential ADC
            - Analog input to ground max voltage: +/-2V or +/-1V without distortion
            - linear amplification region between analog inputs dependant on PGA gain and Vref, (+/-600mV @ Vref = 1.2V)
            - max differential voltage:
                the following table is defined at VREF = 1.2V 
                GAIN PGA_CHn[2:0] / Gain (V/V) / Gain (dB) / VIN Range (V)
                0 0 0 | 1 0 ±0.6
                0 0 1 | 2 6 ±0.3
                0 1 0 | 4 12 ±0.15
                0 1 1 | 8 18 ±0.075
                1 0 0 | 16 24 ±0.0375
                1 0 1 | 32 30 ±0.01875
            - auto zeroing algorithm AZ_FREQ bit in CONFIG register
            - dithering
            - Sinc filter
            - many more features
    - implementation
        - We are using the 1V/V Gain setting on the PGA with 600+/-mV analog differential voltage range.
        - AC voltage measurement
        - Thus a voltage divider has to be calibrated in order to scale the european grid voltage (+/-325V) down to +/-600mV
        - Due to the difference of potentials between zero and ground > +/-2V A galvanic coupling has to be used before measuring the voltage.
