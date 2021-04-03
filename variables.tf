# Variables Configuration

variable "cluster-name" {
  default     = "sbox-stage-6"
  type        = string
  description = "The name of your EKS Cluster"
}

variable "aws-region" {
  default     = "ap-south-1"
  type        = string
  description = "The AWS Region to deploy EKS"
}

variable "availability-zones" {
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  type        = list
  description = "The AWS AZ to deploy EKS"
}

variable "k8s-version" {
  default     = "1.19"
  type        = string
  description = "Required K8s version"
}

variable "kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the node kubelet process"
}

variable "public-kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the public node kubelet process"

}

variable "vpc-subnet-cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "The VPC Subnet CIDR"
}

variable "private-subnet-cidr" {
  default     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  type        = list
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  type        = list
  description = "Public Subnet CIDR"
}

variable "db-subnet-cidr" {
  default     = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  type        = list
  description = "DB/Spare Subnet CIDR"
}

variable "eks-cw-logging" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list
  description = "Enable EKS CWL for EKS components"
}

variable "node-instance-type" {
  default     = "m5.large"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "root-block-size" {
  default     = "32"
  type        = string
  description = "Size of the root EBS block device"

}

variable "simple-node-group-name-1" {
  default     = "simple-nodes-1"
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "desired-capacity" {
  default     = 1
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 1
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}


variable "ec2-key-public-key" {
  default     = "eks-nodes"
  type        = string
}

variable "ec2-key-pair" {
  default     = "eks-nodes"
  type        = string
}

variable "node-spot-instance-type-1" {
  type        = list(string)
  description = "Worker Node EC2 instance type"
  default     = ["m5.large", "m5a.large", "m5.xlarge", "m5a.xlarge", "m5.2xlarge", "m5a.2xlarge", "r5.large", "r5.xlarge", "r5.2xlarge","r5a.large", "r5a.xlarge", "r5a.2xlarge", "c5.xlarge","c5a.xlarge", "c5.2xlarge", "c5a.2xlarge"] 
}


variable "node-spot-node-group-name-1" {
  default     = "spot-nodes-1"
  type        = string
  description = "Worker Node EC2 instance type"
}


variable "node-spot-capacity-type-1" {
  default     = "SPOT"
  type        = string
  description = "Worker Node EC2 instance type"
}


variable "spot-desired-capacity-1" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "spot-max-size-1" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "spot-min-size-1" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}
