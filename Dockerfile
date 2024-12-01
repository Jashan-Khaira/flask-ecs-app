# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 8080

# Use gunicorn instead of flask run for production
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
