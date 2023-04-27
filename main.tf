resource "aws_instance" "test-server" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  key_name = "aws_key"
  vpc_security_group_ids =["sg-071945e4647bcf16f"]
  
  tags = {
    Name = "test-server"
    }
  provisioner "local-exec" {
            command = "sleep 60 && echo 'Instance ready'"
        }
 connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("aws_key.pem")
    host     = aws_instance.test-server.public_ip
  }

  provisioner "local-exec" {
        command = " echo ${aws_instance.test-server.public_ip} > inventory "
  }
 provisioner "local-exec" {
  command = "ansible-playbook /var/lib/jenkins/workspace/FinanceMe/banking.yml "
              }
}
