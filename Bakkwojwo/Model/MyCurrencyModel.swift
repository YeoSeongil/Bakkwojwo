//
//  MyCurrency.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/11/24.
//

import Foundation
import RealmSwift

class MyCurrencyModel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var currencyCode: String
    @Persisted var isCheck: Bool
    
    convenience init(currencyCode: String, isCheck: Bool) {
        self.init()
        self.currencyCode = currencyCode
        self.isCheck = isCheck
    }
    
    let item = ["KRW", "USD", "JPY", "CNY", "EUR", "GBP", "RUB", "HKD", "THB", "TWD", "PHP", "SGD", "VND", "MYR", "MNT", "BHD", "BDT", "BND", "SAR", "LKR", "AED", "OMR", "JOD", "ILS", "INR", "IDR", "QAR", "KZT", "KWD", "PKR", "AUD", "NZD", "CAD", "MXN", "BRL", "CLP", "COP", "ZAR", "NOK", "DKK", "SEK", "CHF", "CZK", "TRY", "PLN", "HUF", "DZD", "EGP", "KES", "TZS"]
}

