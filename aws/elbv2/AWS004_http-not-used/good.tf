# check aws_alb_listener using HTTPS
resource "aws_alb_listener" "my-listener" {
	protocol = "HTTPS"
}

# check aws_alb_listener using HTTP as redirect to HTTPS
resource "aws_alb_listener" "my-listener" {
	protocol = "HTTP"
	default_action {
		type = "redirect"

		redirect {
			port        = "443"
			protocol    = "HTTPS"
			status_code = "HTTP_301"
		}
	}
}

# check aws_alb_listener should pass if a type is "gateway"
resource "aws_lb" "gwlb" {
	load_balancer_type = "gateway"
}

resource "aws_lb_listener" "gwlb_listener" {
	load_balancer_arn = aws_lb.gwlb.id
	  
	default_action {
		target_group_arn = aws_lb_target_group.gwlb_target_group.id
		  type             = "forward"
		}
}