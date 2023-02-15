aws cloudformation create-stack --stack-name example-deployment --template-body file://./ecs.yml --capabilities CAPABILITY_NAMED_IAM --parameters 'ParameterKey=SubnetID,ParameterValue=subnet-e58fafa9'

#aws cloudformation update-stack --stack-name example-deployment --template-body file://./ecs.yml --capabilities CAPABILITY_NAMED_IAM --parameters 'ParameterKey=SubnetID,ParameterValue=subnet-e58fafa9'
#aws cloudformation delete-stack --stack-name example-deployment