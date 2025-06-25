# check-oracle-shape
Script for OCI that notifies when a shape becomes available.  

## Dealing with the password request
`openssl rsa -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_nopass.pem`  
`nano ~/.oci/config` -> replace row with `key_file=~/.oci/oci_api_key_nopass.pem`  

## Installation (change path)
`crontab -e`  
`*/10 * * * * /bin/bash /home/ubuntu/check-a-shape.sh >> /home/ubuntu/a1-check.log 2>&1`  
