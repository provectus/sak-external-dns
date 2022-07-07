variable "aws_private" {
  type        = bool
  description = "Set true or false to use private or public infrastructure"
  default     = false
}

variable "argocd" {
  type        = map(string)
  description = "A set of values for enabling deployment through ArgoCD"
  default     = {}
}

variable "conf" {
  type        = map(string)
  description = "A custom configuration for deployment"
  default     = {}
}

variable "hostedzones" {
  type        = list(string)
  description = "A list of Route53 hosted zones domains to create, need to provide a list of FQDN strings"
  default     = []
}

variable "mainzoneid" {
  type        = string
  default     = ""
  description = "An ID of the root Route53 zone for creating sub-domains"
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "A name of the existing namespace"
}

variable "namespace_name" {
  type        = string
  default     = "external-dns"
  description = "A name of namespace for creating"
}

variable "module_depends_on" {
  default     = []
  type        = list(any)
  description = "A list of explicit dependencies"
}

variable "cluster_name" {
  type        = string
  default     = null
  description = "A name of the Amazon EKS cluster"
}

variable "chart_version" {
  type        = string
  description = "A Helm Chart version"
  default     = "6.5.6"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A tags for attaching to new created AWS resources"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "An ID of the existing AWS VPC"
}

# variable "extraVolumes" {
#   type        = list(string)
#   description = "	A list of volumes to be added to the pod"
#   default     = []
# }

# variable "extraVolumeMounts" {
#   type        = list(string)
#   description = "A list of volume mounts to be added to the pod"
#   default     = []
# }

variable "livenessProbe_enabled" {
  type        = bool
  description = "Enable livenessProbe"
  default     = true
}

variable "livenessProbe_initialDelaySeconds" {
  type        = number
  description = "Initial delay seconds for livenessProbe"
  default     = 10
}

variable "livenessProbe_periodSeconds" {
  type        = number
  description = "Period seconds for livenessProbe"
  default     = 10
}

variable "livenessProbe_timeoutSeconds" {
  type        = number
  description = "Timeout seconds for livenessProbe"
  default     = 5
}

variable "livenessProbe_failureThreshold" {
  type        = number
  description = "Failure threshold for livenessProbe"
  default     = 2
}

variable "livenessProbe_successThreshold" {
  type        = number
  description = "Failure threshold for livenessProbe"
  default     = 1
}

variable "readinessProbe_enabled" {
  type        = bool
  description = "Enable readinessProbe"
  default     = true
}

variable "readinessProbe_initialDelaySeconds" {
  type        = number
  description = "Initial delay seconds for readinessProbe"
  default     = 5
}

variable "readinessProbe_periodSeconds" {
  type        = number
  description = "Period seconds for readinessProbe"
  default     = 10
}

variable "readinessProbe_timeoutSeconds" {
  type        = number
  description = "Timeout seconds for readinessProbe"
  default     = 5
}

variable "readinessProbe_failureThreshold" {
  type        = number
  description = "Failure threshold for readinessProbe"
  default     = 6
}

variable "readinessProbe_successThreshold" {
  type        = number
  description = "Failure threshold for readinessProbe"
  default     = 1
}

variable "annotationFilter" {
  type        = string
  description = "Filter sources managed by external-dns via annotation using label selector"
  default     = ""
}

variable "labelFilter" {
  type        = string
  description = "Select sources managed by external-dns using label selector"
  default     = ""
}

variable "dryRun" {
  type        = bool
  description = "When enabled, prints DNS record changes rather than actually performing them"
  default     = false
}

variable "logLevel" {
  type        = string
  description = "Verbosity of the logs (options: panic, debug, info, warning, error, fatal, trace)"
  default     = "info"
}

variable "logFormat" {
  type        = string
  description = "Which format to output logs in (options: text, json)"
  default     = "text"
}

variable "schedulerName" {
  type        = string
  description = "Alternative scheduler"
  default     = ""
}

variable "replicaCount" {
  type        = number
  description = "Alternative scheduler"
  default     = 1
}
