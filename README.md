# Create the Docker image based on Amazonlinux
`docker build -t amazon-py .`

if running into permissions issue, run this before building:
`chmod +x package.sh`

# Create a container to produce a zip file
`docker run --rm -v $(pwd):/package amazon-py`