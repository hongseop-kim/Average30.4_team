# Worker node role
resource "aws_iam_role" "Node-Group-Role" {
  name = "EKSNodeGroupRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.Node-Group-Role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.Node-Group-Role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.Node-Group-Role.name
}

# Node Group 생성
resource "aws_eks_node_group" "node-ec2" {
  cluster_name    = aws_eks_cluster.wonjong-cluster.name
  node_group_name = "t3_medium-node_group"
  node_role_arn   = aws_iam_role.Node-Group-Role.arn
  subnet_ids      = [aws_subnet.node_sub_a.id, aws_subnet.node_sub_c.id]

  tags = {
    "k8s.io/cluster-autoscaler/enabled"         = "true"
    "k8s.io/cluster-autoscaler/wonjong-cluster" = "owned"
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.medium"]
  #capacity_type  = "ON_DEMAND"
  disk_size = 20

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
}

# Worker node role
resource "aws_iam_role" "dev-Node-Group-Role" {
  name = "dev-EKSNodeGroupRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dev-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.dev-Node-Group-Role.name
}

resource "aws_iam_role_policy_attachment" "dev-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.dev-Node-Group-Role.name
}

resource "aws_iam_role_policy_attachment" "dev-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.dev-Node-Group-Role.name
}

# Node Group 생성
resource "aws_eks_node_group" "dev-node-ec2" {
  cluster_name    = aws_eks_cluster.dev-wonjong-cluster.name
  node_group_name = "t3_medium-dev-node_group"
  node_role_arn   = aws_iam_role.dev-Node-Group-Role.arn
  subnet_ids      = [aws_subnet.dev_node_sub_a.id, aws_subnet.dev_node_sub_c.id]

  tags = {
    "k8s.io/cluster-autoscaler/enabled"         = "true"
    "k8s.io/cluster-autoscaler/wonjong-cluster" = "owned"
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.medium"]
  #capacity_type  = "ON_DEMAND"
  disk_size = 20

  depends_on = [
    aws_iam_role_policy_attachment.dev-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.dev-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.dev-AmazonEKS_CNI_Policy
  ]
}
