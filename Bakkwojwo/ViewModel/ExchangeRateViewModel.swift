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
        self.fetchData(codes: "FRX.USDJPY,FRX.USDCNY", onCompleted: { [weak self] model in
            guard let self = self else { return }
            self.exchangeRateModel = model
        })
    }

}
