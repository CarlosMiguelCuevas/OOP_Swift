let myPaymentProcessor = CardPaymentProcessor(
    cardNumber: "4111111111111111",
    expirationDate: "12/26",
    cvcCode: 123
)

do {
    try myPaymentProcessor.processPayment(20000)
} catch {
    print("there was an error: \(error)")
}
