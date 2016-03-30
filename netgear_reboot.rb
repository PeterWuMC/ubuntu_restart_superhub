require 'logger'

logger = Logger.new(File.join(File.expand_path(File.dirname(__FILE__)), "log/netgear_restart.log"))

logger.debug "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] BEGIN"

a  = `curl http://#{ENV['USERNAME']}:#{ENV['PASSWORD']}@192.168.2.1/ADV_home2_r8000.htm`
id = a.scan(/action=\"newgui_adv_home.cgi\?id=(\d*)\"\s/).flatten.first

`curl -X POST http://#{ENV['USERNAME']}:#{ENV['PASSWORD']}@192.168.2.1/newgui_adv_home.cgi?id=#{id} --data "buttonSelect=2"`

logger.debug "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] END"
