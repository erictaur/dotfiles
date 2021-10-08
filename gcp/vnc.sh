#!/bin/sh

# Install vncserver and XFCE
sudo apt-get install tightvncserver \
    xfce4 xfce4-goodies \
    vnc4server -y

echo "
#!/bin/sh

xrdb \$HOME/.Xresources
startxfce4 &
" >> ~/.vnc/sh_xstartup

mv ~/.vnc/sh_xstartup ~/.vnc/xstartup

# How to tag instance in terminal? 
# Set under Network tags in GConsole

gcloud compute --project=catx-ext-umich \
firewall-rules create vnc-server \
--direction=INGRESS \
--priority=1000 \
--network=default \
--action=ALLOW \
--rules=tcp:5901-5920 \
--source-ranges=0.0.0.0/0 \
--target-tags=vnc-server
