# ThatMicPre
A simple, high-quality DIY microphone pre-amplifier with switched gain.

The background for this project was that I needed a simple but good microphone preamp for doing acoustic measurements. I needed a switched gain to be able to reproduce the gain setting in a more predictable way than what is possible with a potmeter. I could not find any existing DIY designs, so I decided to make one.

The design is based on the excellent THAT1510 preamp IC. I have followed all THAT's datasheets and app-notes to implement a best-practice design. It is also compatible with SSM2019 or INA217.

A goal was to use simple parts that I and other DIYers already have in our parts drawer. So there are no additional IC's or voltage regulators for example, it just uses simple transistors, capacitors and zener diodes for supply filtering and regulation.

<embed src="https://github.com/ojg/thatmicpre/blob/master/plots/thatmicpre_schematic.pdf" width="700" height="500" type="application/pdf">
