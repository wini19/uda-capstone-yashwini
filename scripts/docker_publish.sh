# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=wini19/capstone-yashwini3
echo "Docker path set as: $dockerpath"

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u wini19 -p $1
docker tag capstone-yashwini $dockerpath

# Push image to a docker repository
docker push $dockerpath:latest