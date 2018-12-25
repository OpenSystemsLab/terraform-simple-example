# Acloud.guru example (https://read.acloud.guru/building-a-highly-scalable-resilient-rest-api-with-terraform-go-and-aws-94377b90fd24)


## Create a small instance with Terraform scripts

``` 
brew install jq
aws --version

aws ec2 describe-images --owners 099720109477 --filters 'Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-????????' 'Name=state,Values=available' --output json | jq -r '.Images | sort_by(.CreationDate) | last(.[]).ImageId'

terraform apply
terraform show

```

## ASG: Autoscaling group
>>Auto Scaling Groups (ASG) can automatically provision more instances of our microservice when the loads increase


