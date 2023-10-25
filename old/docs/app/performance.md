# Newtork performances

On Server side :

```bash title="10 = secondes"
iperf -s -i 10
```

On client host :

```bash title="$SERVER = target @iP"
iperf -i 10 -c $SERVER
```

