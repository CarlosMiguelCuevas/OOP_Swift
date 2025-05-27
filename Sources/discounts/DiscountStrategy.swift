public protocol DiscountStrategy{
    func applyDiscount(_ price: Double) -> Double
}
