//
//  OrderTotalView.swift
//  CoffeOrdersL_MVVM_SwiftUI
//
//  Created by Mitya Kim on 7/16/22.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Spacer()
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
                .padding()
            Spacer()
        }
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 100000000.99)
    }
}
