# Use official NGINX image
FROM nginx
# Set environment variable
ENV SITE_NAME="My Custom Docker Site"
# Set working directory inside container
WORKDIR /usr/share/nginx/html
# Copy index.html to working directory
COPY index.html .
# Expose port 80 (NGINX default)
EXPOSE 80
