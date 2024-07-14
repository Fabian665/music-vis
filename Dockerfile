FROM python:3.11.9-slim-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    streamlit=1.36.0 \
    spotipy==2.24.0 \
    plotly=5.22.0

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

CMD ["streamlit", "run", "Galgalaz_Vis.py"]
