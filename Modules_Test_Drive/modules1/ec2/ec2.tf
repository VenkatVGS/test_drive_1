resource "aws_instance" "web_1" {
  ami           = var.ami_id
  instance_type = var.instance_type_id
  associate_public_ip_address = true
  key_name = "vgs_mumbai"
  # subnet_id = aws_subnet.public_subnet_1.id
  subnet_id = var.public_subnet_11
  user_data = file("${path.module}/web-apps.sh")
  vpc_security_group_ids = [var.public_sec_grp]

  tags = {
    Name = "webserver_1"
  }

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("${path.module}/private_keys/vgs_mumbai.pem")
  }

    provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

    provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html"
    ]
  }
}


resource "aws_instance" "web_2" {
  ami           = var.ami_id
  instance_type = var.instance_type_id
  associate_public_ip_address = true
  key_name = "vgs_mumbai"
  # subnet_id = aws_subnet.public_subnet_2.id
  subnet_id = var.public_subnet_22
  user_data = file("${path.module}/web-apps.sh")
  vpc_security_group_ids = [var.public_sec_grp]

  tags = {
    Name = "webserver_2"
  }

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("${path.module}/private_keys/vgs_mumbai.pem")
  }

    provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

    provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html"
    ]
  }
}