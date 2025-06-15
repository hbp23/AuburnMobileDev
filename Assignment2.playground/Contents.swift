import UIKit

typealias Product = (item: String, price: Double)

func MaxMinAvgPrices (array a: [Product]) -> (max: Double, min: Double, avg: Double)? {
   
    let prices: [Double] = a.map(\.price)
    
    let maxPrice = prices.max() ?? 0
    let minPrice = prices.min() ?? 0
    
    let sumPrices = prices.reduce(0, +)
    let avgPrice = sumPrices / Double(prices.count)
    
    return (max: maxPrice, min: minPrice, avg: avgPrice)
    
}

func filterProducts (products : [Product], filter : (Product) -> Bool) -> [Product] {
    var result: [Product] = []
    
    for product in products {
        if filter(product) {
            result.append(product)
        }
    }
    return result
}

let listOfProducts: [Product] = [("Slice of Pizza", 1.99), ("Soda Can", 1.39), ("Fountain Drink", 0.99), ("Bottle of Water", 0.89),
                           ("Gummy Worms", 2.99), ("Chocolate Bar", 1.99), ("Bubble Gum", 0.99)]

let summary = MaxMinAvgPrices(array: listOfProducts)
let filteredProducts = filterProducts(products: listOfProducts) { $0.price < 1 }

print ("Max: \(summary!.max)")
print ("Min: \(summary!.min)")
print ("Avg: \(summary!.avg)")
print ("Filtered: \(filteredProducts)")
