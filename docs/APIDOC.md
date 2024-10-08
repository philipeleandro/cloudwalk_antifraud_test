# Cloudwalk Antifraud Test

## Doc API
In swagger you can find some details about the api routes:
[Click here to check!](http://localhost:3000/api-docs)

But if you curious and want some spoiler, here it is:

obs.: All endpoints must be used with `http://localhost:3000`. Examples:
- `POST http://localhost:3000/users/tokens/sign_in`
- `POST http://localhost:3000/api/v1/transaction_risks`
- `GET http://localhost:3000/api/v1/transaction_risks`

### POST /users/tokens/sign_in
Use this endpoint to generate token authorization to you use other endpoints

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
You generate token in `POST /users/tokens/sign_in`. This endpoint is responsable to receive data about transaction and it must return a recommendation about this specific transaction if you deny or approve it

Headers:
```
Authorization: Bearer "token"
```

Request body:
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
You can add user_id, recommendation and has_cbk params to filter the transactions_risk which belongs to a user or that check recommendation and if has cbk:

Headers:
```
Authorization: Bearer "token"
```

Here some examples of how you can build your URL to send some attribute filter and after get a response:

Filter by user_id:
```
http://localhost:3000/api/v1/transaction_risks?user_id=1
```

Filter by recommendation:
```
http://localhost:3000/api/v1/transaction_risks?recommendation=approve
or
http://localhost:3000/api/v1/transaction_risks?recommendation=deny
```

Filter by has_cbk:
```
http://localhost:3000/api/v1/transaction_risks?has_cbk=true
or
http://localhost:3000/api/v1/transaction_risks?has_cbk=false
```

or you can use more than one filter together
```
http://localhost:3000/api/v1/transaction_risks?has_cbk=true&recommendation=approve&user_id=1
```

But if you want to list all data, use:
```
http://localhost:3000/api/v1/transaction_risks
```

Response body:
```
Queried transaction_risk
```
