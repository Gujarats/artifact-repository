# Infrastructure for creating S3 as artifact repository
You can use this project for creating infrastructure for S3 as artifact repository
This terraform code will create : 
 - IAM user for all developers to have S3 access read 
 - Lamda function to rotate keys
 - Role and policy that needed for IAM user and Lambda function

## Usage

```shell
$ terrafrom init
$ terraform plan -out=out
$ terraform apply out
```
