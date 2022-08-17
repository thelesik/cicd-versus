backimage=thelesik/backend:v1
cd backend
docker build -t $backimage .
docker push  $backimage
