
resource "aws_instance" "app_server" {
  for_each            = var.ec2
  ami           = each.value.ami
  instance_type = each.value.type

  tags = {
    Name = each.value.tag
  }
}

resource "aws_instance" "my-machine" {
  # Creates four identical aws ec2 instances
  count = 4     
  
  # All four instances will have the same ami and instance_type
  ami = lookup(var.ec2_ami,var.region) 
  instance_type = var.instance_type # 
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine-${count.index}"
  }
}
