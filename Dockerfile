# Description: Dockerfile for FastAPI
FROM python:3.12

# Set environment variables
WORKDIR /code

# Install dependencies
COPY ./requirements.txt /code/requirements.txt

# Update package lists and install any necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    && pip install --no-cache-dir --upgrade -r requirements.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy your application
COPY ./app /code/app
COPY ./tests /code/tests

# Run uvicorn server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]