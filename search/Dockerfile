FROM alpine:latest

# Set the working directory

# Copy only the necessary files into the container
COPY . .
RUN apk --no-cache add bash
RUN apk --no-cache add curl

# Make the script executable
RUN chmod +x entrypoint.sh

# Define the command to run the script
CMD ["./entrypoint.sh"]
