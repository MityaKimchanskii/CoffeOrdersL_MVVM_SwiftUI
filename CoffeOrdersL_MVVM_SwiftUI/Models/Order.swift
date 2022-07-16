//
//  Order.swift
//  CoffeOrdersL_MVVM_SwiftUI
//
//  Created by Mitya Kim on 7/15/22.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
    
}
