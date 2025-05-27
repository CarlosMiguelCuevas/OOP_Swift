enum CardPaymentErrors : Error {
    case CardExpired
    case WrongCSV
    case WrongCardNumber
    case DateFormat
    case NoFunds
}


enum CashPaymentErrors : Error {
    case FalseMoney
    case WrongCurrency
}
