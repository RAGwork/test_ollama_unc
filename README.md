# Test Ollama UNC

Dockerized Kedro to run Spark.

## Usage

### Install Docker

See [Install Docker Desktop](https://docs.docker.com/desktop/).

### Build image

* Run the script `./docker/build.sh` on Linux or build the image with `./docker/Dockerfile`. 

### Run container

* Run the script `./docker/run.sh` on Linux or create the container from the previous builded image.

### Docker image customization

To add packages, add them to './context/requirements.txt' (pip requirements format) and build a new image.

### API credentials

* Create `.env` file with:
```
OLLAMA_API_KEY=<your-api-key>
```
