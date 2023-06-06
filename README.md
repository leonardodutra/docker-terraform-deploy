# A Docker container processing terraform
A gitops terraform deployment, secure, fast, always avaliable, run standalone.

How to start with?

1 - Create manualy a s3 bucket to save you terraform state, set values in backend.tf file, region and BucketName.
access you aws console web accesing s3 services, create bucket.

2- git clone

git clone https://github.com/leonardodutra/docker-terraform-deploy

3 - create a docker image named docker-terraform tag latest.

docker build --pull --rm -f "terraform\Dockerfile" -t docker-terraform:latest

4 - when container image has built(you can validate using command => docker images), you need to start container passing aws-cli credentials as enviroment variables.

docker build . -t docker_terrafom --env aws_access_key_id=YYYYYYYYYYYYYYYYYYYYYYYYYYYY --env aws_secret_access_key=XXXXXXXXXXXXXXXXXXXXXXXXXXXX


Here the magic happens, you started a new infra-structure-as-code using terraform. a completely GitOps solution delivery to small organizations.

Additionaly you can run terraform destroy when necessary editing deploy.sh script.
