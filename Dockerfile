# Use Alpine Linux as base image
FROM alpine:latest

# Copy the 'massive-proxy-node' file from src folder to /bin directory in the container
COPY src/massive-proxy-node /bin/massive-proxy-node

RUN adduser -D massive && \
    mkdir -p /stor/var_lib_massive && \
    chown -R massive /stor/ && \
    ln -s /stor/var_lib_massive /var/lib/massive

# Switch to the 'massive' user
USER massive

# Set the entrypoint to launch into the 'massive-proxy-node'
ENTRYPOINT ["/bin/massive-proxy-node"]