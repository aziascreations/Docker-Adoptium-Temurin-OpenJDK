# Docker - Adoptium Temurin OpenJDK
Docker container running on [bitnami/minideb](https://github.com/bitnami/minideb) that contains [Adoptium's *Temurin OpenJDK* distribution](https://adoptium.net/).

**Do not use this container unless you absolutely need to as it won't be maintained and was just a personnal test.**

## Building
### Docker
In order to build this container via the `docker` command, you can use the following command:
```bash
docker build -t aziascreations/minideb-adoptium-temurin-openjdk --target final --force-rm --build-arg openjdk_download_url=https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz --build-arg openjdk_extracted_folder_name=jdk-17.0.1+12 --build-arg openjdk_final_folder_name=adoptium-temurin-17 .
```

### Docker Compose
In order to build this container via the `docker-compose` command, you can use the following command:
```bash
docker-compose build
```
Keep in mind that *Docker Compose* may not remove intermediate containers.

## Parameters
The [Dockerfile](Dockerfile) uses 3 arguments that can be influenced in order to select a specific version of the *OpenJDK* distribution and to adjust the origin and final directories.

### $openjdk_download_url
URL from which the *Temurin OpenJDK* distribution tar archive should be downloaded from via wget.<br>
The link should be grabbed from the [adoptium/temurin17-binaries](https://github.com/adoptium/temurin17-binaries/) repository's releases.

### $openjdk_extracted_folder_name
Root folder contained within the downloaded archive.<br>
This is used when moving the folder from the `downloader` container to the `final` container.

### $openjdk_final_folder_name
Folder into which the extracted folder should be stored in the `final` container.

This argument is appended as-is to `/opt/` !

## License
[Unlicensed](LICENSE)

This license does not apply to any of the applications used by this container.
