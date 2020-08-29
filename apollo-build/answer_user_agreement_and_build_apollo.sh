#!/usr/bin/expect -f

set timeout -1

spawn ./docker/scripts/dev_start.sh

expect "Type 'y' or 'Y' to agree to the license agreement above, or type any other key to exit\r"

send -- "y\r"

./docker/scripts/dev_into.sh

./apollo.sh build_gpu

 bootstrap.sh