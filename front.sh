frontimage=thelesik/frontend:v1
cd frontend
docker build -t $frontimage .
docker push $frontimage
