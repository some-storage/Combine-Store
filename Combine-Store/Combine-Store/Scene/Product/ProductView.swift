import SwiftUI

struct ProductView: View {
    @StateObject var viewModel: ProductViewModel = .init(service: StoreService())
    @State private var isNavigate: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.productList, id: \.id) { product in
                    ProductCell(product: product)
                        .navigationDestination(isPresented: $isNavigate) {
                            DetailView(product: product) 
                        }
                        .onTapGesture { isNavigate.toggle() }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.gray.opacity(0.5))
                }
                .padding(.horizontal, 10)
            }
        }
        .navigationTitle("Store")
        .onAppear(perform: viewModel.fetchProductList)
    }
}

#Preview {
    ProductView()
}
