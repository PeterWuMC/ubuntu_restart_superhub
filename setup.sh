bundle install

#insertting it into your crontab
crontab -l > mycron
echo "*/30 * * * * /bin/bash -c 'source $rvm_path/scripts/rvm && cd $PWD && ruby -rubygems reboot.rb'" >> mycron
crontab mycron
rm mycron
