# Membuat variabel untuk nama image
IMAGE_NAME="karsajobs"
IMAGE_TAG="latest"

# Membuat variabel username github packages
GITHUB_USERNAME="amryyahya"

# Membuat Docker image dari Dockerfile
docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

# Melihat daftar image di lokal
docker images

# Mengubah nama image sesuai dengan format GitHub Packages
NEW_IMAGE_NAME="ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"
docker tag "$IMAGE_NAME:$IMAGE_TAG" "$NEW_IMAGE_NAME"

# Login ke GitHub Packages Docker Registry using Personal Access Token
echo $GITHUB_PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Mengunggah image ke GitHub Packages Docker Registry
docker push "$NEW_IMAGE_NAME"