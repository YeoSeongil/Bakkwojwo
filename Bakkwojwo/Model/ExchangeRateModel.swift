//
//  ExchangeRateModel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/5/24.
//

import Foundation

struct ExchangeRateModel: Codable {
    var country: String // 미국
    var currencyName: String // 달러
    var currencyCode: String // USD
    let basePrice: Double // 1301.1
    let changePrice: Double // 13
    let signedChangeRate: Double // - 0.00112
    let date: String
    let time: String
    var isChecked: Bool = true
}
