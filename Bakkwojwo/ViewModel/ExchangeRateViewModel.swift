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
        pirntRealmURL ()
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
    
    func myCurrency() {
        let myCurrency = realm.read(MyCurrencyModel.self)
        let myCurrencyArr = Array(myCurrency)
        var model = [ExchangeRateModel]()
        
        for item in myCurrencyArr {
            let a = self.exchangeRateModel.filter { $0.currencyCode == item.currencyCode}
            model.append(contentsOf: a)
        }
        self.exchangeRateModel = model
        
        print("호출")
    }
    
    fileprivate func pirntRealmURL() {
        realm.getLocalRealmURL()
    }
    
    fileprivate func initMyCurrency() {
        let myCurrency = realm.read(MyCurrencyModel.self)
        let initModel = countryNameItem.map {
            MyCurrencyModel(currencyCode: $0)
        }
        if myCurrency.isEmpty == true {
            initModel.forEach {
                realm.write($0.self)
            }
        }
    }
    
}
