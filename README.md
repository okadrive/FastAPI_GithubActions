# Github Actions training using FastAPI container

## build
`$ docker build -t my-docker-image .`

## run container (in detached mode)
`$ docker run -dit --name my_docker_container -p 8000:8000 my-docker-image`