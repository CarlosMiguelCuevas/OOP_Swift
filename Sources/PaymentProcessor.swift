import Foundation

protocol PaymentProcessor {
    func processPayment(_ amount:Double) throws
}


public struct CardPaymentProcessor: PaymentProcessor {
    private let cardNumber: String
    private let cvcCode: Int
    private let expirationDate: String
    
    public init(cardNumber: String, expirationDate: String, cvcCode: Int) {
        self.cardNumber = cardNumber
        self.cvcCode = cvcCode
        self.expirationDate = expirationDate
    }
    
    public func processPayment(_ amount: Double) throws {
    
        if !validateCardNumber() {
            throw CardPaymentErrors.WrongCardNumber
        } else if !checkDateFormat() {
            throw CardPaymentErrors.DateFormat
        } else if isCardExpired(){
            throw CardPaymentErrors.CardExpired
        } else {
            print("Success")
        }
        
    }
    
    private func validateCardNumber() -> Bool {
        return cardNumber.removingWhitespaces().count == 16
    }
    
    private func validateFounds() -> Bool {
        return Int.random(in: 1..<100) <= 50
    }
    
    private func checkDateFormat() -> Bool {
        let pattern = "^(0[1-9]|1[0-2])/(\\d{2})$"
        do {
            let regex = try NSRegularExpression(pattern: pattern, options:[])
            let range = NSRange(location: 0, length: self.expirationDate.utf16.count)
            return regex.firstMatch(in:self.expirationDate, range: range) != nil
        } catch {
            return false
        }
    }
    
    private func isCardExpired() -> Bool {
      
        let date = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: date) - 2000 // I dopn't like this, but I was not abel to do substring
        
        let currentMonth = calendar.component(.month, from: date)
        let yearFromCard : Int = Int(self.expirationDate.split(separator: "/")[1])!
        let monthFromCard :Int = Int (self.expirationDate.split(separator: "/")[0])!
     
        print(currentYear, currentMonth, yearFromCard, monthFromCard)
        return currentYear > yearFromCard || (currentYear == yearFromCard && currentMonth > monthFromCard)
    
    }
}

extension String {
    func removingWhitespaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}
