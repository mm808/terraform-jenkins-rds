
# into the DB from the api service
resource "aws_security_group" "api-db-sg" {
  name        = "api-db-${var.env}-ingress-sg"
  description = "Allow access to pigeon-api db"
  vpc_id      = var.vpc-id

  ingress {
    from_port = 0
    to_port = 0
    protocol    = "-1"
    cidr_blocks = var.vpc_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }    
}