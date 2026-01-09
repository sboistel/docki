---
title: iTunz
description: A web interface to manage your iTunes library
---

## Description

iTunz is a simple web application that allows users to download audio from various online sources and organize them into an iTunes-compatible folder structure. It leverages `yt-dlp` for downloading and converting media files to MP3 format. The application provides a user-friendly interface where users can input URLs, initiate downloads, and receive notifications upon completion.

## Docker compose

```yml
---
services:
  itunz:
    container_name: itunz
    build:
      context: src/
      dockerfile: Dockerfile
    restart: unless-stopped
    ports:
      - "5000:5000"
    environment:
      - PUID=0
      - PGID=100
    volumes:
      - dl:/app/downloads
    labels:
      - "com.centurylinklabs.watchtower.enable=false"
volumes:
    dl:
```

## Dockerfile

```Dockerfile
FROM python:3.10

# Install dependencies
RUN apt update && apt install -y ffmpeg && rm -rf /var/lib/apt/lists/*
RUN pip install flask yt-dlp

# PORTS
EXPOSE 5000

# Set working directory
WORKDIR /app

# Copy codes
COPY app/ .

# Run flask app
CMD ["python", "app.py"]
```

## Scripts

### app.py

```python
from flask import Flask, request, render_template
import subprocess
import os
import shutil

app = Flask(__name__)
DOWNLOAD_FOLDER = "downloads"
TMP_DOWNLOAD_FOLDER = "tmp_downloads"
os.makedirs(DOWNLOAD_FOLDER, exist_ok=True)
os.makedirs(TMP_DOWNLOAD_FOLDER, exist_ok=True)

@app.route('/')
def index():
    return render_template('index.html', status="")

@app.route('/download', methods=['POST'])
def download():
    url = request.form['url']
    output_template = os.path.join(
        TMP_DOWNLOAD_FOLDER,
        "%(artist)s/%(release_date>%Y)s - %(album)s/%(track_number)02d - %(title)s.%(ext)s"
    )

    command = [
        "yt-dlp", "-o", output_template,
        "-x", "--audio-format", "mp3", url
    ]
    result = subprocess.run(command, capture_output=True, text=True)

    downloaded_files = []
    for line in result.stdout.splitlines():
        if "Destination" in line:
            downloaded_files.append(line)

    if downloaded_files:
        move_downloaded_files()
        return render_template('index.html', status="Download complete ✅")

    return render_template('index.html', status=f"Download failed ❌: {result.stderr}")

def move_downloaded_files():
    """Moves everything from tmp_downloads/ to downloads/ recursively."""
    for directory in os.listdir(TMP_DOWNLOAD_FOLDER):
        src_path = os.path.join(TMP_DOWNLOAD_FOLDER, directory)
        dst_path = os.path.join(DOWNLOAD_FOLDER, directory)

        if os.path.exists(src_path):  # Ensure the source exists
            shutil.move(src_path, dst_path)  # Moves directories & files recursively

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### templates/index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MP3 Downloader</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }
        h1 {
            color: #333;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        input {
            padding: 10px;
            width: 300px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button-container {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .status {
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }
        .spinner {
            display: none;
            width: 24px;
            height: 24px;
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <h1>MP3 Downloader</h1>
    <form id="download-form" action='/download' method='post'>
        <input type="text" name="url" placeholder="URL" required>
        <div class="button-container">
            <button type="submit" id="download-button">Download</button>
            <div class="spinner" id="spinner"></div>
        </div>
    </form>
    <div class="status">{{ status }}</div>

    <script>
        document.getElementById("download-form").addEventListener("submit", function() {
            // Hide button to show spinner
            document.getElementById("download-button").style.display = "none";
            document.getElementById("spinner").style.display = "block";
        });

        // Request permission to show notifications
        if (Notification.permission !== "granted") {
            Notification.requestPermission();
        }

        // Print notification while downloaded
        function showNotification(title, message) {
            if (Notification.permission === "granted") {
                new Notification(title, { body: message });
            }
        }

        // Check if download completed; if so, show notification
        {% if status %}
        showNotification("Download Completed", "{{ status }}");
        // Hide spinner to show button
        document.getElementById("download-button").style.display = "block";
        document.getElementById("spinner").style.display = "none";
        {% endif %}
    </script>
</body>
</html>
```
