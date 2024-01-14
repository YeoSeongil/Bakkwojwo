//
//  Service.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/14/24.
//

import Foundation

class Service {
    let repository = APIManager.shared
    let realm = RealmManager.shared
    
    var currentModel = [ExchangeRateModel]()
    
    func fetchAllData(onCompleted: @escaping ([ExchangeRateModel]) -> Void) {
        let resultMap = countryNameItem.map({ String("FRX.KRW\($0)") })
        let codes = resultMap.joined(separator: ",")
        var model = [ExchangeRateModel]()
        
        repository.getExchangeRateData(codes: codes) { entity in
            entity.forEach {
                for (key, value) in countryModelItem {
                    if $0.currencyCode == key {
                        let item = ExchangeRateModel(country: value.countryName, currencyName: value.currencyUnit, currencyCode: $0.currencyCode, basePrice: $0.basePrice, changePrice: $0.changePrice, signedChangeRate: $0.signedChangeRate, date: $0.date, time: $0.time)
                        model.append(item)
                        break
                    }
                }
            }
            
            DispatchQueue.main.async {
                let myCurrency = self.realm.read(MyCurrencyModel.self)
                let myCurrencyArr = Array(myCurrency)
                
                model.indices.filter {myCurrencyArr[$0].isCheck == false}.forEach{
                    model[$0].isChecked = false
                }
                
                self.currentModel = model
                onCompleted(self.currentModel)
            }
        }
    }
    
    func fetchData(onCompleted: @escaping ([ExchangeRateModel]) -> Void) {
        let resultMap = countryNameItem.map({ String("FRX.KRW\($0)") })
        let codes = resultMap.joined(separator: ",")
        var model = [ExchangeRateModel]()
        
        repository.getExchangeRateData(codes: codes) { entity in
            entity.forEach {
                for (key, value) in countryModelItem {
                    if $0.currencyCode == key {
                        let item = ExchangeRateModel(country: value.countryName, currencyName: value.currencyUnit, currencyCode: $0.currencyCode, basePrice: $0.basePrice, changePrice: $0.changePrice, signedChangeRate: $0.signedChangeRate, date: $0.date, time: $0.time)
                        model.append(item)
                        break
                    }
                }
            }
            
            DispatchQueue.main.async {
                let myCurrency = self.realm.read(MyCurrencyModel.self)
                let myCurrencyArr = Array(myCurrency)
                var myCurrencyModel = [ExchangeRateModel]()
                
                for item in myCurrencyArr {
                    if item.isCheck == true {
                        let a = model.filter { $0.currencyCode == item.currencyCode}
                        myCurrencyModel.append(contentsOf: a)
                    } 
                }
                
                self.currentModel = myCurrencyModel
                onCompleted(self.currentModel)
            }
        }
    }
}

