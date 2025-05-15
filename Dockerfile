# Use official Node.js LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy application source code
COPY . .

# Expose port (change to your app's port if needed)
EXPOSE 3000

# Run the app
CMD ["node", "server.js"]
