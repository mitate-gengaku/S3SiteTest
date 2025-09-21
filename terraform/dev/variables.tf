variable "github_org" {
  sensitive = true
  type      = string
}

variable "github_repository" {
  sensitive = true
  type      = string
  default   = "*"
}

variable "github_branch" {
  type    = string
  default = "main"
}
