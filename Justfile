VERSION := "latest"

build-frontend-image:
    docker build --platform linux/amd64 --provenance=false -f ./Dockerfiles/frontend.Dockerfile . -t europe-docker.pkg.dev/azin-dev/builder/railpack-frontend:{{VERSION}} --push

build-images: build-frontend-image