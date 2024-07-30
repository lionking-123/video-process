# Use the official Python image from the Docker Hub
FROM python:3.11.2

RUN apt-get update && apt-get install -y \
    libgl1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# Copy the rest of the application code into the container
COPY . .

# Expose the port your Flask app runs on
EXPOSE 4000

# Command to run the application
#CMD ["python3", "main.py"]
ENV FLASK_ENV=development  
ENV FLASK_APP=main.py  

# Command to run the Flask application in development mode  
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]  
