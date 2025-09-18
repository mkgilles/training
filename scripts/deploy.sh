#!/bin/bash

# Build and Deploy Script
set -e

echo "Starting build and deployment process..."

# Environment setup
export NODE_ENV=production
DOCKER_IMAGE="training:latest"
DOCKER_REGISTRY="${DOCKER_REGISTRY:-localhost:5000}"

# Functions
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

check_dependencies() {
    log "Checking dependencies..."
    command -v docker >/dev/null 2>&1 || { echo "Docker is required but not installed. Aborting." >&2; exit 1; }
    command -v npm >/dev/null 2>&1 || { echo "npm is required but not installed. Aborting." >&2; exit 1; }
}

install_dependencies() {
    log "Installing dependencies..."
    npm ci --production
}

run_tests() {
    log "Running tests..."
    npm test
}

build_application() {
    log "Building application..."
    npm run build
}

build_docker_image() {
    log "Building Docker image..."
    docker build -t $DOCKER_IMAGE .
    
    if [ ! -z "$DOCKER_REGISTRY" ]; then
        log "Tagging image for registry..."
        docker tag $DOCKER_IMAGE $DOCKER_REGISTRY/$DOCKER_IMAGE
    fi
}

push_docker_image() {
    if [ ! -z "$DOCKER_REGISTRY" ]; then
        log "Pushing Docker image to registry..."
        docker push $DOCKER_REGISTRY/$DOCKER_IMAGE
    fi
}

deploy_application() {
    log "Deploying application..."
    
    # Stop existing containers
    docker-compose down
    
    # Start new containers
    docker-compose up -d
    
    # Health check
    sleep 10
    if curl -f http://localhost:3000/health; then
        log "Deployment successful!"
    else
        log "Deployment failed - health check failed"
        exit 1
    fi
}

# Main execution
main() {
    log "Starting deployment pipeline..."
    
    check_dependencies
    install_dependencies
    run_tests
    build_application
    build_docker_image
    push_docker_image
    deploy_application
    
    log "Deployment completed successfully!"
}

# Execute main function
main "$@"