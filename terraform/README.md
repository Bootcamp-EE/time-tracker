# timetracker-terraform
This is terraform script to create backend and jenkins server for time-tracking application

## Setup 
- To run terraform from local,install terraform
- Go to the terraform directory
- Create two key pairs timesheet_key and jenkins_key without passphrase  
- Run command terraform init to download aws cli
- Run terraform apply command to run script
- Enter Access-Key and Secret Key of AWS account
- Jenkins will be available at elastic_ip:49001 and Nginx will be available at backend_server_ip:80
