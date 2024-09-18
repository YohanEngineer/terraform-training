terraform {
  required_providers {
    /* Allows only the rightmost version component to increment. 
    This format is referred to as the pessimistic constraint operator. 
    For example, to allow new patch releases within a specific minor release, 
    use the full version number: 
    ~> 1.0.4: Allows Terraform to install 1.0.5 and 1.0.10 but not 1.1.0.
    ~> 1.1: Allows Terraform to install 1.2 and 1.10 but not 2.0.
*/
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    /* 
    Allows only one exact version number. Cannot be combined with other conditions.
    */
    random = {
      source  = "hashicorp/random"
      version = "=3.6.3"
    }
  }
}
