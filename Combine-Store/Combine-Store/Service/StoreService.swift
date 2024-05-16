import Foundation
import Moya
import Combine
import CombineMoya

class StoreService {
    private let provider = MoyaProvider<StoreAPI>(plugins: [MoyaLoggingPlugin()])

    func fetchProductList() -> AnyPublisher<ProductListModel, MoyaError> {
        provider.requestPublisher(.fetchProductList)
            .map(ProductListDTO.self)
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }

    func fetchProduct(with id: Int) -> AnyPublisher<ProductModel, MoyaError> {
        provider.requestPublisher(.fetchProductWithID(id: id))
            .map(ProductDTO.self)
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }

    func searchProduct(keyward: String) -> AnyPublisher<ProductListModel, MoyaError> {
        provider.requestPublisher(.fetchProductList)
            .map(ProductListDTO.self)
            .map { $0.toModel() }
            .eraseToAnyPublisher()
    }
}
