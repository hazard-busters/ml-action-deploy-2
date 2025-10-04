# Base image: start from Ubuntu image
FROM ubuntu:22.04

# Avoid prompts during install
# This is a way to avoid the prompts that usually come with the installation of packages
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and pip 
# This is a way to install the Python and pip packages
# && is a way to run multiple commands in the same line
# apt-get install -y answers yes to all the prompts
# python3-dev is a development package that contains header files, dev tools for building python packages 
# required for installing C extensions packages like numpy, scipy, pandas etc. 
# apt-get clean is a way to clean all cached packages files during downloads
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev && \
    apt-get clean

# Optional: install git if you want to clone repos
RUN apt-get install -y git && apt-get clean

# Set working directory
WORKDIR /app

# Copy your script(s) and data into container and /app/ folder
COPY ml_example.py /app/
COPY data.csv /app/

# Install Python dependencies 
RUN pip3 install --no-cache-dir pandas scikit-learn 

# Command to run the script.
# Only the last CMD instruction in a dockerfile runs
# each element is a separate argument
CMD ["python3", "ml_example.py"]
