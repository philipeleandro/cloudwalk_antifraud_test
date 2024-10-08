# Cloudwalk Antifraud Test

## Tasks
### 1. Understand the Industry
- The answers to the questions made to understand the industry can be found here. [Click to read responses](https://github.com/philipeleandro/cloudwalk_antifraud_test/blob/main/docs/QUESTIONS.md)

### 2. Get your hands dirty
The analyze made about transactions data can be found here. [Click to read analyze](https://github.com/philipeleandro/cloudwalk_antifraud_test/blob/main/docs/DATA_ANALYZE.md)

### 3. Solve the problem
*Stop credit card fraud: Implement the concept of a simple anti-fraud.*

#### Application
This application has the function of indicate some recommendation to approve or deny a transaction based on some rules that will analyze the attributes sent on request body. The rules that are considered to deny a transaction are:
  - If a user (which is owner of the id sent in user_id param) has in transactions history a transaction with `has_cbk` attribute setted with `true`.
  - If a user tries to send a transaction after 10pm with a `transaction_amount` greater than `1000.00`.
  - If the in last minute, a user has more than 5 tries to transact, the next one will be denied.
  - If in one day, the user has at least 5 transaction with 5 different `card_numbers`, the next ones will be denied.

#### Requirements
You must have install these following items to the application runs well:
- docker
- docker-compose

#### Setup
You can start the application by running the following steps in your terminal:
- `git clone git@github.com:philipeleandro/cloudwalk_antifraud_test.git`
- `cd cloudwalk_antifraud_test`
- `docker compose build`
- `docker compose up`

After running this commands, you will see in your terminal messages to database creation, run migrations, seed and server up, then the application will be ready to use.

The seeds creates a user that you can use in the next steps to authorization:
```
email: "cloudwalk_test@test.com"
password: "password"
```

#### Doc API
Here you can check all the routes implemented in the application: [Click here to check!](https://github.com/philipeleandro/cloudwalk_antifraud_test/blob/main/docs/APIDOC.md)
