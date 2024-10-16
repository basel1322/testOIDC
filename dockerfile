# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install --production

# Copy app source code
COPY . .

# Expose the app port (adjust according to your app's needs)
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
