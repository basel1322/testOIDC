# Use an official Node.js runtime as a base image for all architectures
FROM --platform=$BUILDPLATFORM node:18-alpine AS build

# Set environment variables for cross-platform builds
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source code
COPY . .

# Build the app
RUN npm run build

# Use a smaller final image for the production build
FROM --platform=$TARGETPLATFORM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy over dependencies and built app
COPY --from=build /usr/src/app .

# Expose the app port (adjust according to your app)
EXPOSE 8080

# Start the app
CMD [ "npm", "start" ]
