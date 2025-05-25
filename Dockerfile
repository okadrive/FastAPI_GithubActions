FROM python:3.12-slim AS builder

WORKDIR /code
COPY ./requirements.txt /code/requirements.txt

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && export PATH="/root/.cargo/bin:$PATH" \
    && pip install --upgrade pip \
    && pip install --upgrade --no-cache-dir -r requirements.txt \
    && apt-get remove -y build-essential curl \
    && apt-get autoremove -y \
    && rm -rf /root/.cargo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM python:3.12-slim

WORKDIR /code
COPY --from=builder /code /code
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin/uvicorn /usr/local/bin/uvicorn
COPY --from=builder /usr/local/bin/pytest /usr/local/bin/pytest
COPY ./app /code/app
COPY ./tests /code/tests

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]