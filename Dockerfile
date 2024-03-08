# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Create a non-root user with no password
# 'user' is just an example name; you can choose any username you prefer
RUN adduser --disabled-password --gecos '' myuser

# Switch to the non-root user
USER myuser

# Run test_batch.py when the container launches
CMD ["python", "./test_batch.py"]

