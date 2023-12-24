# Use the official Nginx image as the base image
FROM nginx:latest

# Copy your Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy your frontend files to the default Nginx HTML directory

# If you have other configuration files, copy them as well
# COPY conf.d /etc/nginx/conf.d

# Expose the necessary ports
EXPOSE 80
EXPOSE 9000


# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
