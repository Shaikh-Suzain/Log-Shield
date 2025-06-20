#!/bin/bash
mkdir -p archive
mv /var/log/*.log archive/ 2>/dev/null
echo "Archived logs on $(date)">>archive/log_report.txt
echo "Total logs archived: $(ls archive | wc -l)">>archive/log_report.txt

