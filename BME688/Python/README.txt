11/09/2022
==========

- Adaptation de calcAirQuality() en C -> version static basées sur les valeurs utilisées en Python (sensor_values.txt)

12/09/2022
==========

- Comparaison de la lecture gsr sur bme68x.c (pi3g.com) et Kitronik

* Pi3g

// PF Gas resistance
adc_gas_res_low = (uint16_t)((uint32_t)buff[13] * 4 | (((uint32_t)buff[14]) / 64));
adc_gas_res_high = (uint16_t)((uint32_t)buff[15] * 4 | (((uint32_t)buff[16]) / 64));

* Kitronik

# Gas Resistance Data
self.GAS_RES_MSB_0 = 0x2C   # Forced & Parallel: MSB [9:2]
self.GAS_RES_LSB_0 = 0x2D   # Forced & Parallel: Bit <7:6>: LSB [1:0]    Bit <5>: Gas valid    Bit <4>: Heater stability    Bit <3:0>: Gas resistance range

# Read gas resistance ADC registers
self.gResRaw = (self.getUInt8(self.GAS_RES_MSB_0) << 2) | self.getUInt8(self.GAS_RES_LSB_0) >> 6           # Shift bits <7:6> right to get LSB for gas resistance


-> registres au chapitre 5 de la datasheet https://drive.google.com/file/d/1CukVxCsYCt4sRK9Gx4NVTMv5ThiYQnAF/view?usp=sharing


