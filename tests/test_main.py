import pytest
import requests
import allure

# API Gateway endpoint
endpoint = "http://0.0.0.0:8000"

headers = {"Content-Type": "application/json", "Accept": "application/json"}


@allure.step("Test API Gateway")
def test_main():
    # get request
    try:
        response = requests.get(endpoint, headers=headers, timeout=10)

    except requests.exceptions.ConnectionError:
        pytest.fail("API Gateway is not running")

    # verify response
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}
