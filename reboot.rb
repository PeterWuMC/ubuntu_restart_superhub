require 'logger'

require 'capybara/dsl'
include Capybara::DSL

logger = Logger.new(File.join(File.expand_path(File.dirname(__FILE__)), "log/execution.log"))
logger.debug "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] BEGIN"

ping_count = 5
server = "4.2.2.2"
result = `ping -q -c #{ping_count} #{server}`
unless ($?.exitstatus == 0)
  logger.warn "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] ...RESTARTING SUPERHUB"
  begin
    Capybara.default_driver = :selenium
    page.visit("http://activation.virginmedia.com/Activation/")
    page.find(:css, "#continueButtonBig").click
    sleep 2
  rescue => e
    logger.error "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] ...Something is wrong - #{e.class}: #{e.message}: #{e.backtrace}"
  end
end
logger.debug "[#{Time.now.utc.strftime("%Y/%m/%d %H:%M:%S")}] END"
