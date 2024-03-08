# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Boto3 for AWS S3 operations
RUN pip install boto3

# Copy the Python script into the container at /usr/src/app
COPY script.py .

# Create a non-root user 'myuser' with no password
# '-m' option creates a home directory for the user
RUN adduser --disabled-password --gecos '' myuser

# Change the ownership of the work directory to the new user
RUN chown -R myuser:myuser /usr/src/app

# Switch to 'myuser'
USER myuser

# Run script.py when the container launches
CMD ["python", "./script.py"]



