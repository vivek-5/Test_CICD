#!/bin/sh

cd /Back-end
node index.js &
# run the front end
cd /Front-end
nginx -g 'daemon off;'

wait -f
# Exit with status of process that exited first
exit $?

