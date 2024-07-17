provider "aws" {
  region                      = "us-east-1"
  access_key                  = ""
  secret_key                  = ""
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    sts = "https://sts.wasabisys.com"
    iam = "https://iam.wasabisys.com"
    s3  = "https://s3.wasabisys.com"
  }
}
