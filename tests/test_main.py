import pytest
import requests

# テスト対象のAPI Gatewayエンドポイント
endpoint = "http://0.0.0.0:8000"

# HTTPリクエストヘッダー
headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

def test_main():
    # API GatewayエンドポイントにPOSTリクエストを送信
    response = requests.get(endpoint, headers=headers)

    # ステータスコードの検証
    assert response.status_code == 200
