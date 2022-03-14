# ngrok

> get https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz

> tar xvzf ngrok-stable-linux-amd64.tgz -C /usr/local/bin

> curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc 
> /dev/null

> echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list

> apt update && apt install ngrok

> snap install ngrok

> ngrok authtoken 218oHoLLOZgqVR7tex3w2SzDtnq_4rgFjQzqqXYYezF6AxuV9

> ngrok http 80
