//
//  Character.swift
//  HW4
//
//

import Foundation

struct Character: Identifiable, Codable {
    var id = UUID()
    var name: String
    var useful: Int
    var favourite: Bool
    var job:String
}
