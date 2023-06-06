resource "aws_instance" "web_instance" {
  ami           = "ami-0f47fe3e9defb4cbf"
  instance_type = "t2.micro"
  key_name      = "terraform"
  subnet_id                   = aws_subnet.Public_subnet.id
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash -ex

  amazon-linux-extras install nginx1 -y
  echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
  systemctl enable nginx
  systemctl start nginx
  EOF
  tags = {
    "Name" : "Kanye"
  }
}
