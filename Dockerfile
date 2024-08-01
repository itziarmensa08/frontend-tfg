# Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update && apt-get install -y \
  curl \
  git \
  wget \
  unzip \
  libgconf-2-4 \
  gdb \
  libstdc++6 \
  libglu1-mesa \
  fonts-droid-fallback \
  lib32stdc++6 \
  python3 \
  && apt-get clean

# Clone a specific version of Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
WORKDIR /usr/local/flutter
RUN git checkout 68bfaea224  # Check out the specific version

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor

# Enable flutter web
RUN flutter config --enable-web
RUN flutter config --no-enable-macos-desktop --no-enable-windows-desktop --no-enable-linux-desktop --no-enable-android --no-enable-ios

# Copy files to container and build
COPY . /app/
WORKDIR /app/
RUN flutter pub get
RUN flutter build web --dart-define=env=production --no-tree-shake-icons

# Stage 2 - Create the run-time image with Apache
FROM httpd:alpine

# Copy built app files to the Apache server's root directory
COPY --from=build-env /app/build/web /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
