sudo echo "su -l "$USER" -c '.Xvfb :1 -screen 0 1280x1024x24 >/dev/null 2>&1 &'" >> /etc/rc.local 
bundle install

#insertting it into your crontab
crontab -l > mycron
echo "*/30 * * * * DISPLAY=localhost:1.0 /bin/bash -c 'source $HOME/.rvm/scripts/rvm && cd $PWD && ruby -rubygems reboot.rb'" >> mycron
crontab mycron
rm mycron
