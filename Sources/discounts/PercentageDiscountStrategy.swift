
public struct PercentageDiscountStrategy: DiscountStrategy {
    
    private let persentage: Int
    
    public init(_ persentage: Int) {
        if persentage < 0 || persentage > 100 {
            fatalError("Persentage must be between 0 and 100")
        }
        self.persentage = persentage
    }
    
    public func applyDiscount(_ price: Double) -> Double {
        return price * (1 - Double(persentage) / 100)
    }
}
