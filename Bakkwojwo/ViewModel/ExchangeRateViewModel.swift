//
//  ExchangeRateViewModel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/5/24.
//

import Foundation

class ExchangeRateViewModel {
    private let realm = RealmManager.shared
    private let repository = APIManager.shared
    
    var onUpdated: () -> Void = {}
    
    var exchangeRateModel: [ExchangeRateModel] = [ExchangeRateModel]()
    {
        didSet {
            onUpdated()
        }
    }
    
    init() {
        initMyCurrency()
        pirntRealmURL()
        fetchData()
    }
    
    func fetchData() {
        let resultMap = countryNameItem.map({ String("FRX.KRW\($0)") })
        let codes = resultMap.joined(separator: ",")
        
        repository.getExchangeRateData(codes: codes) { entity in
            var model = [ExchangeRateModel]()
            
            entity.forEach {
                for (key, value) in countryModelItem {
                    if $0.currencyCode == key {
                        let item = ExchangeRateModel(country: value.countryName, currencyName: value.currencyUnit, currencyCode: $0.currencyCode, basePrice: $0.basePrice, changePrice: $0.changePrice, signedChangeRate: $0.signedChangeRate, date: $0.date, time: $0.time)
                        model.append(item)
                        break
                    }
                }
            }
            self.exchangeRateModel = model
        }
    }
    
    func myCurrencyTest() {
        let myCurrency = realm.read(MyCurrencyModel.self)
        let myCurrencyArr = Array(myCurrency)
        var arr = [ExchangeRateModel]()
        
        for item in myCurrencyArr {
            let a = self.exchangeRateModel.filter { $0.currencyCode == item.currencyCode}
            arr.append(contentsOf:a)
        }
        self.exchangeRateModel = arr
    }
    
    func pirntRealmURL() {
        realm.getLocalRealmURL()
    }
    
    fileprivate func initMyCurrency() {
        let myCurrency = realm.read(MyCurrencyModel.self)
        if myCurrency.isEmpty == true {
            [MyCurrencyModel(currencyCode: "KRW"), MyCurrencyModel(currencyCode: "USD"), MyCurrencyModel(currencyCode: "JPY"), MyCurrencyModel(currencyCode: "EUR"), MyCurrencyModel(currencyCode: "CNY")].forEach {
                realm.write($0.self)
            }
        }
    }
}
