# Terminate EC2 instance
aws ec2 terminate-instances --instance-ids i-xxxxxxxxxxxxxxxxx

# Delete key pair from AWS
aws ec2 delete-key-pair --key-name monitoring-key

# Remove local key files
rm monitoring-key monitoring-key.pub monitoring-key.pem