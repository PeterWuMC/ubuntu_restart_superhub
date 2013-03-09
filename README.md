This version of the project is using a USB power relay to force power in/out of the router, in order to simulate a reboot. Since virgin superhub lack of remote reboot function, an external hardware is needed.

### Hardware
http://cgi.ebay.co.uk/ws/eBayISAPI.dll?ViewItem&item=251215222287&ssPageName=ADME:X:RTQ:GB:1123

### Driver
FTDI - http://dograt.homelinux.com:8080/products/files/4xRelay-USB/demo_source/set_relay_linux_r26.tar.bz2

### Installation

then run the setup.sh (only run it once, otherwise you would have created duplicated startup script and crob task)

currently its set to check your internet connectivity every 30minutes


### Log
check log/execution.log to find out about the execution status.
