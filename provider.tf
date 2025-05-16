terraform {
    backend "s3" {
        bucket =  "statefilebucket-808"
        key = "terraform/statefile/terraform.tfstate"
        use_lockfile = true
        encrypt = true
        region ="us-east-1"

    }
}

provider "aws" {

}