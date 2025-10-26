VERSION := "latest"

build-frontend-image:
    docker build -f ./Dockerfiles/frontend.Dockerfile . -t ghcr.io/lttle-cloud/railpack-frontend:{{VERSION}} --push

build-images: build-frontend-image