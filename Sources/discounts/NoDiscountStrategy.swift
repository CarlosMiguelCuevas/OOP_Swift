public struct NoDiscountStrategy: DiscountStrategy {
    public func applyDiscount(_ price: Double) -> Double {
        return price
    }
}
