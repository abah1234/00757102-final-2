//
//  CoffeeShopData.swift
//
//
//   Created by 蔡文彬 on 2021/1/6.
//  
//

import Foundation

struct Shop: Codable,Identifiable{
    var id: UUID
    var name: String
    var address: String
    var wifi: Double
    var seat: Double
    var quiet: Double
    var tasty: Double
    var cheap: Double
    var latitude: String
    var longitude: String
    var open_time: String?
    var socket: String?
    var standing_desk: String?
    var limited_time: String?
    //var url: URL?
    
    
    
    
}

struct ShopResults: Codable {
    var resultCount: Int
    var results: [Shop]
}
