# Docker Personal Cloud

This dockerfile is used to create a personal calendar and file upload system which can be accessed from any computer

This Docker image is based on Debian Bullseye Slim and includes the following:

- File Upload
- Personalised Calendar scheduling
- SSH server (`openssh-server`)

This container is configured to allow SSH login as root with a predefined password and mounts the Calcurse data to a volume. It also provides a directory (`/uploads`) for file uploads.

## Features

- **SSH Access**: Root login enabled with password.
- **Calcurse**: A terminal-based calendar application for scheduling and reminders.
- **Uploads Directory**: A writable directory `/uploads` where scp can be used to upload.

## Prerequisites

- Docker installed on your system.

## Building the Image

To build the Docker image, run:

```
docker build -t < image-name > .
```

## To run the container
```
docker run -d --name <container-name> -p 2222:22 -v $(pwd)/calcurse-data:/root/.calcurse <image-name>
```

## To check if it is running

```
docker ps
```

## Running Commands

Upload files 
```
scp -P 2222 <filename> root@<localhost>:/root/uploads/
```

Download files
```
scp -P 2222 root@<localhost>:/root/uploads/<filename> ./<local filename> 
```

> **WARNING**: Change <'localhost'> to your IP address before running

This repository is made and maintained by [Tanush](https://github.com/tanushgolwala)
