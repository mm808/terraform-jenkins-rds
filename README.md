# api-db-infrastructure #
This project is for deploying an RDS postgres database in AWS. It was originally created to isolate the creation and updating of this resource from the rest of a new api project and can be used to create a RDS database that can be used with an application without tightly coupling its creation to the application project.

### How To ###   
The basic steps of using this repo are to work on it in a branch, run the plan stage of the pipeline and verify the changes are what you expect them to be, then run the apply stage.   
Once the changes are in place and verified, promote the changes from the branch to the main branch.    
The pipeline has been designed for use in a Jenkins server.    

### Deployments ###    
Use the Build with parameters button and enter the terraform action (plan,apply), the commit hash of your changes and the environment you are deploying to. Because the apply stage uses a plan file with the commit hash as part of its name, you must run a plan stage before the apply stage and use the same commit hash in both stages. See infrastructure/terraform/terraform_script.sh for details.    

### Some details ###
The _development_shell_ directory provides a Docker image you can use that has Terraform installed so you can work locally without having to install anything on your machine.    
Paths in run_shell.sh must match your local paths. All this is optional and to avoid installing different versions of terraform on your machine.    

The _pipeline_ directory is for the Jenkins and buildspec files.   

The terraform code is in the _infrastructure/terraform_ directory. The module structure is set up to create the network items then the rds instance and the databases last.   
Environment specific settings are provided through the {env}.tfvars files.   

The _secrets.tf_ file creates the database user and password and stores them in Secrets Manager. These values are needed in the api project and are referenced there.
_When redeploying this project_ a new database password is created each time! This means you must deploy a new api task definition to pick up the new db password.   

_Items to note about infrastructure_    
<u>db_subnet_group_name</u> items were created manually in the console
