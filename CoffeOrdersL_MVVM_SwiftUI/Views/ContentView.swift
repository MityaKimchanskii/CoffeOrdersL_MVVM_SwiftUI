//
//  ContentView.swift
//  CoffeOrdersL_MVVM_SwiftUI
//
//  Created by Mitya Kim on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.blue)
                }, trailing: Button(action: showAddCoffeeView) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.blue)
                })
                .sheet(isPresented: self.$showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
