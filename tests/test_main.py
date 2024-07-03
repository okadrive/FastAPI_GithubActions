import pytest
import requests

# API Gateway endpoint
endpoint = "http://0.0.0.0:8080"

headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

def test_main():
    # get request
    try:
        response = requests.get(endpoint, headers=headers, timeout=10)

    except requests.exceptions.ConnectionError:
        pytest.fail("API Gateway is not running")

    # verify response
    assert response.status_code == 200
