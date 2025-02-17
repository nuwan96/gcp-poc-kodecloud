FROM python:3.8-slim-buster

WORKDIR /app

# Copy only the requirements file first to take advantage of Docker caching
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip3 install -r requirements.txt

# Now copy the rest of the application code
COPY . .

# Note: Changed '--host:0.0.0.0' to '--host=0.0.0.0'
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
