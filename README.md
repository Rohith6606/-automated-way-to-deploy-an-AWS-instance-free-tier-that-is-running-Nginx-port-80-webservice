# -automated-way-to-deploy-an-AWS-instance-free-tier-that-is-running-Nginx-port-80-webservice

1)Create an automated way to deploy an AWS instance (free tier) that is running Nginx (port 80) webservice.

2)This will point to a html file that has to display a text page (your choice).
 you will learn how to automatically deploy an Nginx Web Server on an EC2 instance, with Terraform.
 
 
Prerequisites

An active AWS account with an IAM user already created
Text editor of your choice (VSCode Recommended)
Terraform Installed
As you should know by now, Terraform is an IaC tool that helps to automate processes which increase delivery time of software. In this tutorial, Terraform will be employed in setting up an ec2 instance and deploying an nginx web server on it using bash scripts which will be provided.

Setting up project environment
First step is to create a folder on your device and open it up in VSCode. We will be creating 3 terraform files for this project;

1)terraform.tfvars

2)module.tf

3)userdata.tpl

1.Terraform.tfvars

Your terraform.tfvars file is going to contain private information that shouldn't be shared with the public. In the file, copy and paste the below configuration.

Your access and secret key should be filled in. You can get that from the IAM user you created.

The key_name is the name of the key which will be used to ssh into your instance. If you have an existing one you can use that. If you don't, lets create one together.

2.Module.tf

The variable section consists of the variables you created in the terraform.tfvars file

The provider section contains information of your provider, region and information which connects terraform to your AWS account. Be sure to specify the region you are making use of in AWS. In my case I am using the N.Virginia region (us-east-1)

The data section contains information of your instance. Data sources are like read-only references in Terraform. They aren’t resources in the sense that they create anything, but they can be referenced by actual resources to pull information from AWS where applicable.

The resources section contains information of your ami, VPC and security group. You can modify this depending on your use case.

The output section is basically what you want to be printed to the screen after your resources have been created. In this case, your instance's public dns would be printed out for you.

3.Userdata.tpl

This file will contain the bash script which will install nginx on your instance.

Run the terraform files 

terraform init

This will initialize your directory and install necessary plugins needed. It is the first command that has to be run after writing a new terraform configuration.

After initialization run

terraform validate

The above commands checks your terraform configuration files for errors.

terraform plan

This would show you the steps or execution plan that terraform wants to take.

terraform apply

This command carries out the plan and creates your infrastructure for you

You can see the output dns which you asked terraform to print to your screen.

Copy and paste the output dns on a webpage and you should see your echo output message from the bashcript you wrote earlier on.

you can delete your resources with the below command

terraform destroy -auto-approve
