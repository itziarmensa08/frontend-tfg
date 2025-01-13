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
RUN git checkout tags/3.27.1

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

# Stage 2 - Create the run-time image
FROM nginx:stable-alpine AS runner

COPY default.conf /etc/nginx/conf.d
# COPY package.json /usr/share/nginx/html
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80
