import Foundation

struct ProductModel {
    let id: Int
    let title, description, brand, category, thumbnail: String
    let discountPercentage, rating: Double
    let price, stock: Int
    let images: [String]
}
