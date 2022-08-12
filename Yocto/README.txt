A simple Yocto demonstration using a MPL115A2 sensor connected to a Raspberry Pi (I2C bus).

A Linux service reads the temperature from the sensor and sends a JSON frame to a MQTT broker.

We use "test.mosquitto.org" as a MQTT broker and "view-forest" as the MQTT topic.

