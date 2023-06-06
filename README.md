# A Docker container processing terraform
A gitops terraform deployment, secure, fast, always avaliable, run standalone.

How to start with?

1 - git clone

git clone https://github.com/leonardodutra/docker-terraform-deploy

2 - create a docker image named docker-terraform tag latest.

docker build --pull --rm -f "terraform\Dockerfile" -t docker-terraform:latest

3 - when container image has built(you can validate using command => docker images), you need to start container passing aws-cli credentials as enviroment variables.

(must to be implement it, i using vscode with docker module that provide a button that solve this situation) 
examples:
docker run --env VAR1=value1 --env VAR2=value2
aws_access_key_id = YYYYYYYYYYYYYYYYYYYYYYYYYYYY
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
