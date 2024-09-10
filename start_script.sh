#!/bin/sh

cd /Back_end
node index.js &
# run the front end
#cd /Front_end
nginx -g 'daemon off;'

wait -f
# Exit with status of process that exited first
exit $?

