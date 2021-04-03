resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = var.cluster-name
  node_group_name = var.simple-node-group-name-1
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = data.aws_subnet_ids.private.ids
 

  scaling_config {
    desired_size = var.desired-capacity
    max_size     = var.max-size
    min_size     = var.min-size
  }

  remote_access {
    ec2_ssh_key     = var.ec2-key-pair
  }

  instance_types = [
    var.node-instance-type
  ]

  lifecycle {
    create_before_destroy = true
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy
  ]
  tags = {
    Name = var.simple-node-group-name-1
  }
}


resource "aws_eks_node_group" "eks-spot-node-group" {
  cluster_name    = var.cluster-name
  node_group_name = var.node-spot-node-group-name-1
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = data.aws_subnet_ids.private.ids


  scaling_config {
    desired_size = var.spot-desired-capacity-1
    max_size     = var.spot-max-size-1
    min_size     = var.spot-min-size-1
  }

  remote_access {
    ec2_ssh_key     = var.ec2-key-pair
  }

  lifecycle {
    create_before_destroy = true
  }
  
  instance_types = var.node-spot-instance-type-1
  capacity_type = var.node-spot-capacity-type-1
  

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role_policy_attachment.node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-AmazonEKS_CNI_Policy
  ]
  tags = {
    Name = var.node-spot-node-group-name-1
  }
}