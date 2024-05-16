import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var productList: [ProductModel] = []
    private let service: StoreService
    private var bag: Set<AnyCancellable> = .init()
    
    init(service: StoreService) {
        self.service = service
    }

    func fetchProductList() {
        service.fetchProductList()
            .sink(receiveCompletion: {
                print("\($0)")
            }, receiveValue: { [weak self] in
                self?.productList = $0.products
            })
            .store(in: &bag)
    }
}
