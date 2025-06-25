# check-oracle-shape
Script for OCI that notifies when a shape becomes available.  

## Installation (change path)
`crontab -e`  
`*/10 * * * * /bin/bash /home/ubuntu/check-a-shape.sh >> /home/ubuntu/a1-check.log 2>&1`  
