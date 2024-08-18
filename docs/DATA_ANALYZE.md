## Transaction Analysis - Identification of Possible Fraud

After analyzing the provided data, we can identify some relevant observations related to possible fraud in transactions, highlighting the following points:

- There were 31 cases where different users used the same card number. This is a significant indicator of suspicious behavior, as credit cards are typically linked to a single holder. These situations may suggest shared card use or fraudulent activities, such as cloning.
- We identified 114 users making transactions with more than one card. Although not necessarily a sign of fraud, this could indicate suspicious behavior, such as the use of unauthorized or shared cards.
- There were also 391 transactions considered fraudulent (has_cbk = true), with amounts ranging from R$ 2.89 to R$ 4,097.21.
- The five users most involved in fraudulent transactions were:
  - User 11750: 25 transactions
  - User 91637: 19 transactions
  - User 79054: 15 transactions
  - User 96025: 13 transactions
  - User 78262: 12 transactions
- Some devices stood out for being associated with multiple fraudulent transactions. For example:
  - Device 563499: 19 transactions
  - Device 342890: 15 transactions
  - Device 101848: 15 transactions
  - Device 438940: 13 transactions

In addition to the data from the spreadsheet, other essential points might include:
  - Device IP
  - Transaction history
  - Risk score
  - Fingerprint
  - User personal data
