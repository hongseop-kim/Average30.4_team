# eks cluster IAM Role생성
resource "aws_iam_role" "eks-cluster-role" {
  name = "seo-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-role.name
}

resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-cluster-role.name
}

# eks-Cluster 생성
resource "aws_eks_cluster" "wonjong-cluster" {
  name     = "SEO-cluster"
  role_arn = aws_iam_role.eks-cluster-role.arn

  vpc_config {
    subnet_ids = [aws_subnet.pri_sub_a.id, aws_subnet.pri_sub_c.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.wonjong-cluster.endpoint
}

# eks cluster IAM Role생성
resource "aws_iam_role" "dev-eks-cluster-role" {
  name = "seo-dev-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "dev-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.dev-eks-cluster-role.name
}

resource "aws_iam_role_policy_attachment" "dev-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.dev-eks-cluster-role.name
}

# eks-Cluster 생성
resource "aws_eks_cluster" "dev-wonjong-cluster" {
  name     = "seo-dev-cluster"
  role_arn = aws_iam_role.dev-eks-cluster-role.arn

  vpc_config {
    subnet_ids = [aws_subnet.dev_pri_sub_a.id, aws_subnet.dev_pri_sub_c.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.dev-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.dev-cluster-AmazonEKSVPCResourceController,
  ]
}

output "dev_endpoint" {
  value = aws_eks_cluster.dev-wonjong-cluster.endpoint
}
