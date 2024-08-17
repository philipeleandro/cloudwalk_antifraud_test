## Explain the money flow and the information flow in the acquirer market and the role of the main players.
### information flow:
When a customer initiates a purchase using a card, the payment terminal (POS machine) captures the transaction data and sends it to the acquirer. The acquirer then forwards this data to the card companies which, in turn, transmits it to the card issuer. The issuer performs a series of checks, such as validating the card, checking the available balance (in the case of a debit transaction) or credit limit, and conducting anti-fraud security procedures. After these verifications, the issuer sends an authorization (or rejection) response to the card companies which then passes it back to the acquirer. The acquirer communicates this response to the payment terminal, completing the information cycle.
### Money flow:
Once the transaction is authorized, the issuer commits to paying the amount to the acquirer, who then credits this amount (minus service fees) to the merchant. This process may involve reconciliation, where the acquirer verifies and ensures that the amounts match the recorded transactions. The funds are transferred between the bank accounts of the participants, with the issuer debiting the corresponding amount from the customer’s balance or credit limit, and the acquirer crediting the net amount to the merchant. Depending on the contract, the payment to the merchant can occur immediately (D+0) or after a few days (D+1, D+2, etc.). The acquirer disburses the amount, deducting its fees and commissions, which cover processing services, associated risks, and other administrative operations.

### Main players:
  - **Merchants**: These are the commercial establishments that accept credit or debit card payments. They hire the services of an acquirer to process these transactions.<br>
  - **Acquires**: Acquirers are companies that provide the necessary infrastructure for merchants to accept card payments. They connect merchants to issuers and card companies, ensuring that transactions are processed correctly..<br>
  - **Card companies**: card companies, such as Visa, Mastercard, and Elo, are responsible for setting the rules and standards for card transactions. They facilitate the connection between acquirers and issuers.<br>
  - **Issuing bank**: These are financial institutions (usually banks) that issue cards to consumers. They are responsible for credit analysis, transaction authorization, and, eventually, billing the consumer.<br>

## Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players.
The acquirer is a company that processes financial transactions made through credit and debit cards and provides direct intermediation services between the merchant and the participants in the payment chain (issuer banks and card networks). In the traditional payment flow, the acquirer is responsible for capturing the transaction data, sending it for authorization to the issuer, and, after approval, settling the amounts with the merchant. It is the primary intermediary between the merchant and the issuer.

The sub-acquirer is a payment facilitator, a company that acts as an intermediary between the merchant and the acquirer, connecting the merchant with market acquirers. The main difference between an acquirer and a sub-acquirer lies in the level of communication. Using sub-acquiring services can offer advantages related to multi-acquirer connections, simplified integration, and anti-fraud tools included in the service package. Here are some differences regarding sub-acquiring:

  - The sub-acquirer collects the transaction data and sends it to the acquirer. The acquirer then processes the transaction authorization, just as in the traditional flow.

  - The settlement of funds goes through the acquirer, but it is the sub-acquirer that makes the final disbursement to merchants. The merchant’s direct relationship is with the sub-acquirer, not with the acquirer.


Meanwhile, the gateway has the specific function of connecting the merchant's operations (exclusively in the e-commerce context) to the chosen payment services when there is no infrastructure for direct integration with one of the other two service providers. After transmitting the information to the gateway, the flow follows the same process as in the traditional method, depending on who receives the data for processing. Here are some differences:

  - The gateway securely sends the transaction data to the acquirer or sub-acquirer. It does not perform authorization checks or handle financial settlement.

  - The gateway does not participate in the flow of money. Financial settlement is still carried out by the acquirer or sub-acquirer.

## Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.
Cancellation of a transaction occurs when it is voided before it is completed or settled, and this can happen immediately after the transaction is made. When a cancellation is requested, certain rules are validated depending on the business model and situation to determine whether the refund will be processed or not.

A refund is the process of reversing a completed and settled transaction, which can be either a full or partial refund. In the case of a partial refund, the transaction is not fully canceled, which is common in online retail.

Refunds are closely related to fraud, both in terms of fraud protection and fraudulent use. For example, some malicious consumers make legitimate purchases but later dispute the transaction to receive the product or service without paying for it; a refund occurs when the cardholder claims not to recognize a transaction where a third party used the card data without authorization; frequent refunds, especially those related to fraud, can damage the merchant's reputation with the acquirer and card networks.