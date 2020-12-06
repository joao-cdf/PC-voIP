# Build Image

```bash
docker build -t 'pc-voip' --no-cache .
```

# Run container

docker run -d \
--name pc-voip \
-p 5060:5060 \
-v ~/repos/PC-voIP/volume/log:/var/log/asterisk \
-v ~/repos/PC-voIP/volume/sounds:/var/lib/asterisk/sounds \
-v ~/repos/PC-voIP/volume/keys:/var/lib/asterisk/keys \
-v ~/repos/PC-voIP/volume/phoneprov:/var/lib/asterisk/phoneprov \
-v ~/repos/PC-voIP/volume/spool/asterisk:/var/spool/asterisk \
pc-voip