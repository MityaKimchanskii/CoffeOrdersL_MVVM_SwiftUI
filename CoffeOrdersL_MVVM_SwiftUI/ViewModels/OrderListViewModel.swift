//
//  OrederListViewModel.swift
//  CoffeOrdersL_MVVM_SwiftUI
//
//  Created by Mitya Kim on 7/15/22.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders: [OrderViewModel] = []
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        Webservice().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID() 
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        self.order.name
    }
    
    var size: String {
        self.order.size
    }
    
    var coffeeName: String {
        self.order.coffeeName
    }
    
    var total: Double {
        self.order.total
    }
}
