#!/bin/bash

mkdir -p parsed_logs

awk '{print $NF}' logs/ssh_fake.log | sort | uniq -c > parsed_logs/ip_stats.txt

grep 'sudo' archive/auth.log >> parsed_logs/sudo_activity.txt

echo "Parsing complete. Output saved in parsed_logs/"
