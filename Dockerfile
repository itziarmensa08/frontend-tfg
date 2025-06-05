# Stage 1 - Build the Flutter app
FROM debian:latest AS build-env

# Install Flutter dependencies
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

# Clone Flutter repository and checkout the specified version
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
WORKDIR /usr/local/flutter
RUN git checkout tags/3.32.0

# Set Flutter binary path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run Flutter doctor to check setup
RUN flutter doctor

# Enable Flutter for web only
RUN flutter config --enable-web \
    && flutter config --no-enable-macos-desktop \
    --no-enable-windows-desktop \
    --no-enable-linux-desktop \
    --no-enable-android \
    --no-enable-ios

# Set the working directory for the app
WORKDIR /app

# Copy the app source code into the container
COPY . .

# Fetch dependencies and build the app
RUN flutter pub get
RUN flutter build web --dart-define=env=production --no-tree-shake-icons

# Stage 2 - Run the built Flutter web app using NGINX
FROM nginx:stable-alpine AS runner

# Copy the nginx configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the build output from the previous stage
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]