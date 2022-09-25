//
//  FacKtData.swift
//  FacKt
//
//  Created by ahmet on 10.04.22.
//

import Foundation

struct FactData : Codable{
    let text: String
    let source:String
}

struct ReturnedData {
    let factText: String
    let factSource: String
}
