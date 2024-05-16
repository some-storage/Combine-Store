import SwiftUI

struct ProductCell: View {
    var product: ProductModel

    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                VStack(alignment: .leading) {
                    Text(product.title)
                    Text("\(product.price)$")
                        .font(.callout)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
