terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">=4.33.0"
      configuration_aliases = [aws.virginia]
    }
  }

  required_version = ">=1.2.0"
}

