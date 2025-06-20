#!/bin/bash

mkdir -p logs

for i in {1..10}
do
  echo "$(date) - Fake SSH attempt from IP 192.168.1.$((RANDOM%255))" >> logs/ssh_fake.log
done

echo "Generated 10 fake log entries in logs/ssh_fake.log"

# Testing branch
