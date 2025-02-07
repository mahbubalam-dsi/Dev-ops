# Use Alpine Linux as the base image
FROM alpine:latest

# Install required dependencies (curl and jq)
RUN apk add --no-cache curl jq

# Set the working directory inside the container
WORKDIR /app

# Copy the script into the container
COPY commit.sh commit.sh

# Give execution permission to the script
RUN chmod +x commit.sh

# Run the script when the container starts

ENTRYPOINT ["sh", "./commit.sh"]

