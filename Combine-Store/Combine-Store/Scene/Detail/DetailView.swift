//
//  DetailVie .swift
//  Combine-Store
//
//  Created by 조병진 on 5/16/24.
//

import SwiftUI

struct DetailView: View {

    var product: ProductModel

    var body: some View {
        Text(product.title)
    }
}
