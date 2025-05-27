let shopingCart = ShoppingCartSingleton.getInstance()
let shopingCartCopy = ShoppingCartSingleton.getInstance()

let product1 = Product(name: "iphone", price: 1000)
let product2 = Product(name: "macBook", price: 3000)
let product3 = Product(name: "Lenovo", price: 700)
let product4 = Product(name: "Pixel9", price: 999)
let product5 = Product(name: "Meta Quest", price: 500)

shopingCart.addProduct(product1,quantity: 3)
shopingCart.addProduct(product2,quantity: 2)
shopingCartCopy.addProduct(product3,quantity: 1)
shopingCart.addProduct(product4,quantity: 6)
shopingCart.addProduct(product5,quantity: 9)


shopingCartCopy.getTotalPrice()
