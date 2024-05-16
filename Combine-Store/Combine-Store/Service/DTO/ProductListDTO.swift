import Foundation

struct ProductListDTO: Decodable {
    let products: [ProductDTO]
}

extension ProductListDTO {
    func toModel() -> ProductListModel {
        .init(products: products.map { $0.toModel() })
    }
}
