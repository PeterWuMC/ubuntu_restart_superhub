require 'logger'

logger = Logger.new(File.join(File.expand_path(File.dirname(__FILE__)), "log/execution.log"))
logger.debug "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] BEGIN"
logger.level = Logger::WARN

ping_count = 5
server = "8.8.8.8"
result = `ping -q -c #{ping_count} #{server}`
unless ($?.exitstatus == 0)
  logger.warn "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] ...RESTARTING SUPERHUB"
  begin
    `sudo /home/system/relay-driver/set_relay_GPLv3/set_relay -d /dev/ttyUSB0 -r 4 -1`
    sleep 2
    `sudo /home/system/relay-driver/set_relay_GPLv3/set_relay -d /dev/ttyUSB0 -r 4 -0`
  rescue => e
    logger.error "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] ...Something is wrong - #{e.class}: #{e.message}: #{e.backtrace}"
    logger.error "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] #{page.body}"
  end
end
logger.debug "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] END"
