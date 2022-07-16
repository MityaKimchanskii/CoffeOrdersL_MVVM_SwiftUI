//
//  AddCoffeeOrderViewModel.swift
//  CoffeOrdersL_MVVM_SwiftUI
//
//  Created by Mitya Kim on 7/15/22.
//

import Foundation


class AddCoffeeOrdeViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = "Cappuccino"
    
    private var webservice: Webservice
    
    init() {
        self.webservice = Webservice()
    }
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        
        let order = Order(name: self.name, coffeeName: self.coffeeName, size: self.size, total: self.total)
        
        self.webservice.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
 
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
