VERSION := "latest"

build-frontend-image:
    docker build --platform linux/amd64 --provenance=false -f ./Dockerfiles/frontend.Dockerfile . -t europe-docker.pkg.dev/azin-dev/builder/railpack-frontend:{{VERSION}} --push

update-railpack-images:
    crane copy ghcr.io/railwayapp/railpack-builder:latest {{REGISTRY_DEV}}/railpack-builder:{{VERSION}}
    crane copy ghcr.io/railwayapp/railpack-runtime:latest {{REGISTRY_DEV}}/railpack-runtime:{{VERSION}}

build-images: build-frontend-image update-railpack-images