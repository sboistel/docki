# HomeAssistant

## Installation

### Pre-Requirement

Update the system; then reboot

```shell
sudo apt update -y
sudo apt upgrade -y
```

Next step, installing depedences :

```shell
sudo apt-get install -y python3 python3-dev python3-venv python3-pip bluez libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0-dev tzdata ffmpeg liblapack3 liblapack-dev libatlas-base-dev
```

## Configuration

### Python Venv

Create the main python venv :

```pyhton
python3 -m venv homeassistant
```

Source it and install `wheel`

```bash
source homeassistant/bin/activate
```

```python
python3 -m pip install wheel
```

Once you have installed the required Python package, it is now time to install Home Assistant Core

```python
pip3 install homeassistant
```

## Run

Source the python venv and run `hass` command :

```bash
source homeassistant/bin/activate
```

```python
hass
```

Then go to `http://X.X.X.X:8123`

Layrier commander :

```shell
ip a | awk '/global/ {print "http://"$2}'|sed 's/\/24/:8123/g'
```

## References

- [https://www.home-assistant.io/installation/](https://www.home-assistant.io/installation/)

