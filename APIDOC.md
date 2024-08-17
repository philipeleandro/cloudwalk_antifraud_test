# Cloudwalk Antifraud Test

## Doc API
In swagger you can find some details about the api routes:
[Click here to check!](http://localhost:3000/api-docs)

But if you curious and want some spoiler, here it is:

### POST /users/tokens/sign_in
Request body
```
{
    "email": "string",
    "password": "string"
}
```

Response body:
```
  "token": "string",
  "refresh_token": "string",
  "expires_in": "integer",
  "token_type": "string",
  "resource_owner": {
      "id": "integer",
      "email": "string",
      "created_at": "string",
      "updated_at": "string"
  }
```

### POST /api/v1/transaction_risks
You generate token in `POST /users/tokens/sign_in`

Headers:
```
Authorization: Bearer "token"
```

Request boby:
```
{
  "transaction_id": "string",
  "merchant_id": "string",
  "user_id": "string",
  "card_number": "string",
  "transaction_date": "string",
  "transaction_amount": "string",
  "device_id": "string"
}
```

Response:
```
{
  transaction_id: "integer"
  recommendation: "string"
}
```

### GET /api/v1/transaction_risks
You can add user_id, recommendation and has_cbk params to filter the transactions_risk which belongs a user or that check recommendation and if has cbk:
Example:
Filter by user_id:
```
https://www.example.com/api/v1/transaction_risks?user_id=1
```

Filter by recommendation:
```
https://www.example.com/api/v1/transaction_risks?recommendation=approve or https://www.example.com/api/v1/transaction_risks?recommendation=deny
```

Filter by has_cbk:
```
https://www.example.com/api/v1/transaction_risks?has_cbk=true or https://www.example.com/api/v1/transaction_risks?has_cbk=false
```

or you can use more than one filter together
```
https://www.example.com/api/v1/transaction_risks?has_cbk=true&recommendation=approve&user_id=1
```

But if you want to list all data, use:
```
https://www.example.com/api/v1/transaction_risks
```

Response body:
```
Queried transaction_risk
```
