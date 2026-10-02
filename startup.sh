#!/bin/sh
# Revive contract: start the app on 0.0.0.0:8080 if it is not already healthy.
if curl -sf -o /dev/null --max-time 1 http://127.0.0.1:8080/; then
  exit 0
fi
cd /workspace || exit 1
npm run dev > /tmp/ms2-dev.log 2>&1 &
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do
  curl -sf -o /dev/null --max-time 1 http://127.0.0.1:8080/ && exit 0
  sleep 0.5
done
exit 0
