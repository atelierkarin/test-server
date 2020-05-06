# Build Images
docker build -t atelierkarin/test-server:latest -t atelierkarin/test-server:$GIT_SHA

# Push to docker hub
docker push atelierkarin/test-server:latest
docker push atelierkarin/test-server:$GIT_SHA

# Apply config file to k8s
kubectl apply -f k8s

# Update images
kubectl set image deployments/test-server-deployment server=atelierkarin/test-server:$GIT_SHA