# Base image: start from Ubuntu
FROM ubuntu:22.04

# Avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev && \
    apt-get clean

# Optional: install git if you want to clone repos
RUN apt-get install -y git && apt-get clean

# Set working directory
WORKDIR /app

# Copy your script(s) into container
COPY ml_example.py /app/

# Install Python dependencies (adjust as needed)
RUN pip3 install --no-cache-dir pandas scikit-learn matplotlib

# Command to run the script
CMD ["python3", "ml_example.py"]
