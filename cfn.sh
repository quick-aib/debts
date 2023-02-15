# aws cloudformation create-stack \
#   --stack-name myteststack \
#   --template-body file:///Users/ravi/debts/ec2.yml \
#   --parameters ParameterKey=InstanceType,ParameterValue=t2.small

#aws cloudformation list-stack-resources --stack-name myteststack

aws cloudformation delete-stack --stack-name myteststack

# aws cloudformation update-stack \
#   --stack-name myteststack \
#   --template-body file:///Users/ravi/debts/ec2.yml \
#   --parameters ParameterKey=InstanceType,ParameterValue=t2.small