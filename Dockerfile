# Description: Dockerfile for FastAPI
FROM python:3.12

# Set environment variables
WORKDIR /code

# Install dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy your application
COPY ./app /code/app
COPY ./tests /code/tests

# Run uvicorn server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]