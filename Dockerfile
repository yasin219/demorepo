# Use official Node image
FROM node:18

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# App runs on port 3000 (change if needed)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]