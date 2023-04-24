resource "aws_instance" "test-server" {
  ami           = "ami-02eb7a4783e7e9317" 
  instance_type = "t2.micro" 
  key_name = "kavanapc2023"
  vpc_security_group_ids =["sg-071945e4647bcf16f"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = " kavanapc2023.ppk"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
  }
  tags = {
    Name = "test-server"
  }
  provisioner "local-exec" {
        command = " echo ${aws_instance.test-server.public_ip} > inventory "
  }
   provisioner "local-exec" {
  command = "ansible-playbook /var/lib/jenkins/workspace/<Replace-jenkins-project-name>/test-server/ banking.yml  "
  } 
}
