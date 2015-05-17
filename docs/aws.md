# AWS Cheatsheet

Sign up in AWS Console

## EC2

Launch a new instance: `Amazon Linux AMI 2014.09.2 (HVM)`

The basics:
```shell
sudo yum clean all;
sudo yum update;
sudo yum install git;
git clone https://github.com/vnegrisolo/workstation.git;
cd workstation;
gem install bundle;
```

## EC2 SSH

1 - Create a `Key Pair` and download it

```shell
ssh -i key.pem ec2-user@ec2-ip.sa-east-1.compute.amazonaws.com
```

## EC2 CLI

In Security Credentials create:

1 - `Group` admin
2 - `Roles` admin-ec2
3 - `User` my-user
4 - In user > manage access key - create access key and download it
5 - copy access key and secret key and save it as env var:

```shell
export AWS_ACCESS_KEY=my-access;
export AWS_SECRET_KEY=my-secret;
```

Commands:

* `ec2-describe-instances` - show all instances
* `ec2-describe-regions` - show the regions
