ThatMicPre
=====
A simple, high-quality DIY microphone pre-amplifier with switched gain.

The background for this project was that I needed a simple but good microphone preamp for doing acoustic measurements. I needed a switched gain to be able to reproduce the gain setting in a more predictable way than what is possible with a potmeter. I could not find any existing DIY designs, so I decided to make one.

The design is based on the excellent THAT1510 preamp IC. It is also compatible with SSM2019 or INA217. I have followed all THAT's datasheets and app-notes to implement a robust, best-practice design.

A goal was to use simple through-hole parts that I and other DIYers usually have in our parts drawer. So there are no additional IC's or voltage regulators for example, it just uses simple transistors, capacitors and zener diodes for supply filtering and regulation. I selected affordable switches and connectors to keep cost down. Many parts can be substituted without sacrificing performance.

This is an open-source project released under CC-BY-SA-4.0 license. It basically means you can use it as you want as long as you share modifications under the same license, and attribute back to this project. See [LICENSE.txt](../blob/master/LICENSE.txt) for details.

Specifications
-----
* Microphone preamplifier with switched gain and 48V phantom power.
* XLR input and output connectors.
* Phantom power on/off switch.
* Phase invert switch.
* Gains (dB): 0, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60.
* Gain deviation from nominal: Max +/-0.5dB using R12-series resistors.
* Frequency response: 0/-3dB from 10Hz to 100kHz for all gain settings.
* Impedance balanced output.
* Max output level: 20dBu at 0.1% THD (1kHz).
* THD+N less than 0.005% at 1kHz at 18dBu output level for all gain settings (20-20kHz BW).
* 48V DC power supply required, 30mA max. 
  * (Will operate with lower voltage DC power supplies with reduced phantom voltage and max output level).
* PCB dimensions 75mm x 120mm, fits the [Hammond 1455K120x](https://www.hammfg.com/part/1455K1201) enclosure.
  * Gain switch on top of enclosure for easy access.

Schematic
-----
![alt text](https://github.com/ojg/thatmicpre/blob/master/plots/thatmicpre_schematic.png "Schematic")

PCB
-----
3D PCB render (v1.1)
![alt text](https://github.com/ojg/thatmicpre/blob/master/plots/thatmicpre_3dview.png "PCB 3D view")

Photo of completed prototype (v1.0)
![alt text](https://github.com/ojg/thatmicpre/blob/master/docs/thatmicpre_pcb_v1.0.JPG "PCB photo")

Measurements
-----
### Output noise vs gain
20-22kHz BW un-wtd, 150ohm source impedance
| Gain(dB) | Output Noise (dBu) | EIN (dBu) |
| --- | --- | --- |
| 0 | -98.5 | -98.5 |
| 10 | -98.2 | -108.2 |
| 15 | -97.8 | -112.8 |
| 20 | -96.8 | -116.8 |
| 25 | -95.6 | -120.6 |
| 30 | -93.2 | -123.2 |
| 35 | -89.8 | -124.8 |
| 40 | -86.8 | -126.8 |
| 45 | -82.6 | -127.6 |
| 50 | -77.8 | -127.8 |
| 55 | -73.1 | -128.1 |
| 60 | -68.3 | -128.3 |

### Frequency Response
![alt text](https://github.com/ojg/thatmicpre/blob/master/docs/freqresp_vs_gain.png "Frequency response")

### THD+N vs Frequency
![alt text](https://github.com/ojg/thatmicpre/blob/master/docs/thdvsfreq_vs_gain.png "THDN vs frequency")

### THD+N vs Amplitude
![alt text](https://github.com/ojg/thatmicpre/blob/master/docs/thdvsamp_vs_gain.png "THDN vs amplitude")

### Common Mode Rejection Ratio
![alt text](https://github.com/ojg/thatmicpre/blob/master/docs/cmrr_vs_gain.png "CMRR")

### Bandpass Noise Level
Note no measureable hum.

![alt text](https://github.com/ojg/thatmicpre/blob/master/docs/bandpassnoise_vs_freq_vs_gain.png "Bandpass")

---
OJG 2020
