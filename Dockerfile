# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install boto3 for AWS interactions
RUN pip install boto3

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Ensure all users can read and execute the script
RUN chmod a+rx test_batch.py

# Create a non-root user with no password
# 'user' is just an example name; you can choose any username you prefer
RUN adduser --disabled-password --gecos '' myuser

# Switch to the non-root user
USER myuser

# Run test_batch.py when the container launches
CMD ["python", "./test_batch.py"]



