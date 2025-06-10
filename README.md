# Test Ollama UNC

Dockerized JupyterLab with Langchain library to test Ollama UNC.

## Usage

### Install Docker

See [Install Docker Desktop](https://docs.docker.com/desktop/).

### Build image

* Run the script `./docker/build.sh` on Linux or build the image with `./docker/Dockerfile`. 

### Run container

* Run the script `./docker/run.sh` on Linux or create the container from the previous builded image.
* Execute
```sh
docker logs rag
```
* Locate a url like `http://127.0.0.1:8888/lab?token=....` in the output.

* Copy the url and paste into a web browser to see JupyterLab interface.

### Docker image customization

To add packages, add them to './context/requirements.txt' (pip requirements format) and build a new image.

### API credentials

* Create `.env` file with:
```
OLLAMA_API_KEY=<your-api-key>
```
