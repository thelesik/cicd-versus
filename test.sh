
backimage=thelesik/backend:v1
frontimage=thelesik/frontend:v1
cat ~/my_password.txt | docker login --username thelesik --password-stdin
cd backend
docker build -t $backimage .
docker push  $backimage
cd ..
cd frontend
docker build -t $frontimage .
docker push $frontimage
