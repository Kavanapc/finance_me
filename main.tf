resource "aws_instance" "test-server" {
  ami           = "ami-02eb7a4783e7e9317" 
  instance_type = "t2.micro" 
  key_name = "kavanapc2023"
  vpc_security_group_ids =["sg-071945e4647bcf16f"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("/root/.ssh/kavanapc2023")
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
  }
  tags = {
    Name = "test-server"
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "kavanapc2023"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGV0/K3HwyqTEy2Pwb8Dj/e5L/EvnZDpu+X3p93j8U2tfa2Qo6rKBmUHKJPfoV5UAlqqXOSnaNbRLlx31BNEZCkbX+Hfg/BENAQysU/3U+Whtqw2ghtbGPHn0z7Ez8GMo7QJZA7nL4dCAFJp7dCf2fLLAaS7lHrbjYuRZJruwxf6QX+Ng4FhbKmJat/v9RTRfGvDotXrYvXaFYU241Tc/TMl3GkXAwWVNJr4pPQC7puAKecll8Xs7vt0UuWtzahTrHwrDnPxE3M6S7O1NfxxW5LwaeG2WOZT8mEp0LV0T3nM2NCbbBHLVs91xp9A0+VHwEP7DpHTrxKu4gKxMWy93Z2USnPrRwvKF2HEe+MW2yyNlTlsl0FtKPq0XLEKgoc3NkwuVCx72NRlJUmujgyb3uLVn3pSoJUTVOXVLPll5G/6yO28Roatu6DCMF0HimZOkl7nwDFGtwk0cP7XoVUVyFrUYEZWSzlwnXoA/WV3hXx9QU7m36qUc+K+yM5WIf6yc= root@ip-172-31-34-172"
}

