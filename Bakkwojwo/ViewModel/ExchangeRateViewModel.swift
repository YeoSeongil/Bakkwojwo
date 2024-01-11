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
    
    func fetchData(codes: String, onCompleted: @escaping ([ExchangeRateModel]) -> Void) {
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
    
    func test() {
    }

    
}
