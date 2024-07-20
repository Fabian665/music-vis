# Music-Vis: Dockerized Streamlit App for Music Data Visualization

This repository contains a Dockerized Streamlit application developed for a Data Visualization course. The app provides various visualizations and analyses of music data.

## Project Structure

The main components of this project are containerized using Docker. For detailed information about the source code and implementation of the Streamlit app, please refer to our [src repository](https://github.com/placeholder/src-repo-link).

## Setup and Configuration

### Python Environment

You can set up the Python environment using either Conda or pip:

#### Using Conda:
```bash
conda env create -f environment.yml
conda activate music-vis
```

#### Using pip:
```bash
pip install -r requirements.txt
```

### Spotify API Credentials

This project uses the Spotify API. You need to set up your Spotify developer credentials:

1. Go to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/)
2. Create a new app to get your `Client ID` and `Client Secret`

If you plan on using the dev image:

```bash
export SPOTIPY_CLIENT_ID='your-spotify-client-id'
export SPOTIPY_CLIENT_SECRET='your-spotify-client-secret'
```
If you plan on using the deployment image add this to `src/.streamlit/secrets.toml`

```toml
[spotipy]
client_id = "your-client-id"
client_secret = "your-client-secret"
```

For more detailed information on setting up Spotify credentials, refer to the [Spotipy documentation](https://spotipy.readthedocs.io/en/2.22.1/#authorization-code-flow).

## Docker

### Dev Image

The dev image is a host machine development oriented image. It uses regular environemnt variables for the Spotify API secrets and mounts a data path to the container as a data source.  

This configuration depends on the following files not provided here:
`data/galgalaz_expanded.csv`

#### Building the Image

To build the Docker image, run:

```bash
docker build -t music-vis .
```

#### Running the Container

We use Docker Compose to run the container. To start the application:

```bash
docker-compose up
```

This will start the Streamlit app, and you can access it by navigating to `http://localhost:8501` in your web browser.

### Deployment Image

The deployment image tries to mimic the environment on streamlit community servers

This configuration depends on the following files not provided here:
`src/.streamlit/secrets.toml`

#### Building the Image

To build the Docker image, run:

```bash
docker build -f Dockerfile.deploy -t music-vis .
```

#### Running the Container

We use Docker Compose to run the container. To start the application:

```bash
docker-compose -f docker-compose.deploy.yaml up
```

This will start the Streamlit app, and you can access it by navigating to `http://localhost:8501` in your web browser.


---

For more information about this project, visit our [GitHub repository](https://github.com/Fabian665/music-vis).