#!/bin/bash
./puma --pidfile ./puma.pid -e production -q -w `cat /proc/cpuinfo | grep 'model name' | wc -l | awk '{ print $1 * 2; }'` -d --preload

