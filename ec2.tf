# Explanation: This is your “Han Solo box”—it talks to RDS and complains loudly when the DB is down.
resource "aws_instance" "cloudknights" {
  ami                    = ami-068c0051b15cdb816
  instance_type           = "t3.micro"
  subnet_id               = aws_subnet.chewbacca_public_subnets[0].id
  vpc_security_group_ids  = [aws_security_group.chewbacca_ec2_sg01.id]
  iam_instance_profile    = aws_iam_instance_profile.chewbacca_instance_profile01.name

  # TODO: student supplies user_data to install app + CW agent + configure log shipping
  # user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "${local.name_prefix}-ec201"
  }
}
