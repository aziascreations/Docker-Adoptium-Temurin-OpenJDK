# syntax=docker/dockerfile:1

# Preparing the container that will download and extract adoptium's distribution of the OpenJDK...
FROM bitnami/minideb:latest AS downloader
RUN apt-get update && apt-get -y install wget

# Downloading and extracting the JDK from adoptium...
ARG openjdk_download_url
WORKDIR /openjdk
RUN wget -O /openjdk/openjdk.tar.gz "$openjdk_download_url"
RUN tar -xvf /openjdk/openjdk.tar.gz -C /openjdk

# Preparing the final container...
FROM bitnami/minideb:latest AS final

# Copying the extracted files...
ARG openjdk_extracted_folder_name
ARG openjdk_final_folder_name
COPY --from=downloader /openjdk/$openjdk_extracted_folder_name /opt/$openjdk_final_folder_name

# Setting the environment variables for future containers...
ENV JAVA_HOME /opt/$openjdk_final_folder_name
ENV PATH $PATH:/opt/$openjdk_final_folder_name/bin

# Setting labels...
LABEL org.opencontainers.image.authors="herwin.bozet@gmail.com"
LABEL maintainer="herwin.bozet@gmail.com"
