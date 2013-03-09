bundle install

#insertting it into your crontab
crontab -l > mycron
echo "*/30 * * * * DISPLAY=localhost:1.0 /bin/bash -c 'source $HOME/.rvm/scripts/rvm && cd $PWD && ruby -rubygems reboot.rb'" >> mycron
crontab mycron
rm mycron
