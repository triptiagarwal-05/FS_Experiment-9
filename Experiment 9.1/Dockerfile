# =========================
# 1️⃣ Build Stage
# =========================
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app source
COPY . .

# Build the React app for production
RUN npm run build


# =========================
# 2️⃣ Production Stage
# =========================
FROM nginx:alpine

# Copy compiled static files from build stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80

# Start Nginx web server
CMD ["nginx", "-g", "daemon off;"]
