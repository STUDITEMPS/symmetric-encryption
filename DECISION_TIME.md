# Decision Time

The producer of the event has a list of fields to encrypt and replaces their value with the an object containing the encrypted value and some meta information, notably the name of the key used. The consumer has the same list, and for each field finds the used key by its given name and so can reproduce the original value.

In our CoP Architecture Meeting on 2022-08-03 we discussed three different solutions to the "which fields to encode" complex. In our next meeting on 2022-08-17 we will vote for one these proposal to be the final solution:

* Use the "pii" field.

* Use the "pii" field, and add "https://studitemps.tech/specification/domain-event-encrypted-pii"  as flag to the @type field

* Add a new field named "encryptedFields" that contains a list of encrypted fields
