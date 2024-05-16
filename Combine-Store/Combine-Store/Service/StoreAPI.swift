import Foundation
import Moya

enum StoreAPI {
    case fetchProductWithID(id: Int)
    case fetchProductList
    case searchProduct(keyward: String)
}

extension StoreAPI: TargetType {
    var baseURL: URL { URL(string: "https://dummyjson.com")! }

    var path: String {
        switch self {
        case .fetchProductWithID(let id):
            return "/products/\(id)"
        case .fetchProductList:
            return "/products"
        case .searchProduct:
            return "/products/search"
        }
    }

    var method: Moya.Method { .get }

    var task: Moya.Task {
        switch self {
        case let .searchProduct(keyward):
            return .requestParameters(
                parameters: ["q": keyward],
                encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? { ["Content-Type": "application/json"] }
}
