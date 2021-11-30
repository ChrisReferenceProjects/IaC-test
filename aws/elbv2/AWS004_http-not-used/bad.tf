# check aws_alb_listener using plain HTTP
resource "aws_alb_listener" "my-listener" {
	protocol = "HTTP"
}

# check aws_lb_listener using plain HTTP
resource "aws_lb_listener" "my-listener" {
	protocol = "HTTP"
}

# check aws_alb_listener using plain HTTP (via non specification)
resource "aws_alb_listener" "my-listener" {
}

# check aws_alb_listener should continue checks if the referenced if a load balancer type is not "gateway"
resource "aws_lb" "gwlb" {
	load_balancer_type = "application"
}

resource "aws_lb_listener" "gwlb_listener" {
	load_balancer_arn = aws_lb.gwlb.id
	  
	default_action {
		target_group_arn = aws_lb_target_group.gwlb_target_group.id
		type             = "forward"
    }
}