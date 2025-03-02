# AWS VM for Managed Identity Talk

All the code in this repo does is to deploy a basic AWS Linux VM, which I use as part of a talk on some of the under the hood details of Azure Managed Identities.  The VM is used to illustrate a newly spun up device, with no Azure connection or installed software, using a Managed Identity access token to access resources.

## Prerequesites
* An AWS account, free tier is fine.

* The latest AWS CLI installed and authenticated.  See https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

* The latest version of Terraform installed.  See https://developer.hashicorp.com/terraform/install

* The Terraform will look for an SSH key in the current home directory.  An AWS compliant key can be created with this command ```ssh-keygen -t ed25519 -f ~/.ssh/flask-demo-vm -m PEM -b 2048``` (Noting that you should add a passphrase and some extra security for hosts that you care about.)


