docker build -t $IMAGE:latest -t $IMAGE:$SHA -f ./build/Dockerfile ./build
docker push $IMAGE:latest
docker push $IMAGE:$SHA
kubectl apply -f k8s
kubectl set image someapp-deployment some-app=$IMAGE:$SHA