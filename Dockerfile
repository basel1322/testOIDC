# Use the official Python image from Docker Hub as a base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Specify any dependencies here (optional)
# RUN pip install --no-cache-dir -r requirements.txt

# Run the Python script when the container starts
CMD [ "python", "./app.py" ]
