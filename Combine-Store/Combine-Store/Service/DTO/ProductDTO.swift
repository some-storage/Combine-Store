import Foundation

struct ProductDTO: Decodable {
    let title, description, brand, category, thumbnail: String
    let discountPercentage, rating: Double
    let id, price, stock: Int
    let images: [String]
}

extension ProductDTO {
    func toModel() -> ProductModel {
        .init(
            id: id,
            title: title,
            description: description,
            brand: brand,
            category: category,
            thumbnail: thumbnail,
            discountPercentage: discountPercentage,
            rating: rating,
            price: price,
            stock: stock,
            images: images
        )
    }
}
