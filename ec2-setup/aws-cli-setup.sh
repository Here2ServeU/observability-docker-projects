# Step 1: Generate SSH Key Pair
ssh-keygen -t rsa -b 2048 -f monitoring-key -N ""

# Step 2: Import public key into AWS
aws ec2 import-key-pair --key-name "monitoring-key" --public-key-material fileb://monitoring-key.pub

# Step 3: Launch EC2 instance
aws ec2 run-instances \
  --image-id ami-0c02fb55956c7d316 \
  --instance-type t2.micro \
  --key-name monitoring-key \
  --security-groups allow_ssh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=monitoring-demo}]'