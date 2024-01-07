//
//  ExchangeRateViewModel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/5/24.
//

import Foundation

class ExchangeRateViewModel {
    let repository = APIManager()
    
    var onUpdated: () -> Void = {}
    
    var exchangeRateModel: [ExchangeRateModel] = [ExchangeRateModel]()
    {
        didSet {
            print("TEST : exchangeRateModel Updated!")
            onUpdated()
        }
    }
    
    func fetchData(codes: String, onCompleted: @escaping ([ExchangeRateModel]) -> Void) {
        repository.getExchangeRateData(codes: codes) { entity in
            var model = [ExchangeRateModel]()
            
            for index in entity {
                for k in countryModelItem {
                    if index.currencyCode == "\(k.key)" {
                        let item = ExchangeRateModel(country: k.value.countryName, currencyName: k.value.currencyUnit, currencyCode: index.currencyCode, basePrice: index.basePrice, changePrice: index.changePrice, signedChangeRate: index.signedChangeRate, date: index.date, time: index.time)
                        model.append(item)
                    }
                }
            }
            onCompleted(model)
        }
    }
    
    func korDataLoad() {
        let resultMap = countryNameItem.map({ String("FRX.KRW\($0)") })
        let codes = resultMap.joined(separator: ",")
        
        self.fetchData(codes: codes, onCompleted: { [weak self] model in
            guard let self = self else { return }
            self.exchangeRateModel = model
        })
        
    }
    
    func usdDataLoad() {
        let resultMap = countryNameItem.map({ String("FRX.\($0)USD") })
        let codes = resultMap.joined(separator: ",")
        
        self.fetchData(codes: codes, onCompleted: { [weak self] model in
            guard let self = self else { return }
            self.exchangeRateModel = model
            
            var model = [ExchangeRateModel]()
            
            let usdIndex = self.exchangeRateModel.indices.filter ({
                self.exchangeRateModel[$0].currencyCode == "USD"
            }).first
            
            self.exchangeRateModel.map {
                if $0.currencyCode == "USD" {
                    self.exchangeRateModel.remove(at: usdIndex!)
                    let item = ExchangeRateModel(country: "대한민국", currencyName: "원(₩)", currencyCode: "KRW", basePrice: $0.basePrice, changePrice: $0.changePrice, signedChangeRate: $0.signedChangeRate, date: $0.date, time: $0.time)
                    self.exchangeRateModel.insert(item, at: self.exchangeRateModel.startIndex)
                }
            }
        })
    }
    
}
