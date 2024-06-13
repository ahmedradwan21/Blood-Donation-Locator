# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install necessary system dependencies, including OpenGL libraries and Tesseract
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libgl1-mesa-glx \
    libgl1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt 
RUN pip install --no-cache-dir -r requirements.txt
# Define environment variable
ENV NAME World
# Run app.py when the container launches
CMD ["python", "app.py"]
