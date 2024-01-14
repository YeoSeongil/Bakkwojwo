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
    let service = Service()
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
        dataLoad()
    }
    
    func dataLoad() {
        service.fetchData { [weak self] Model in
            guard let self = self else { return }
            self.exchangeRateModel = Model
        }
    }
    
    func allDataLoad() {
        service.fetchAllData { [weak self] Model in
            guard let self = self else { return }
            self.exchangeRateModel = Model
        }
    }
    
    func myCurrencyUpdate(_ item: [Bool]) {
        let myCurrency = realm.read(MyCurrencyModel.self)
        realm.update(MyCurrencyModel.self) {_ in
            myCurrency.indices.filter {item[$0] == false}.forEach{
                myCurrency[$0].isCheck = false
            }
            myCurrency.indices.filter {item[$0] == true}.forEach{
                myCurrency[$0].isCheck = true
            }
        }
    }

    fileprivate func pirntRealmURL() {
        realm.getLocalRealmURL()
    }
    
    fileprivate func initMyCurrency() {
        let myCurrency = realm.read(MyCurrencyModel.self)
        let initModel = countryNameItem.map {
            MyCurrencyModel(currencyCode: $0, isCheck: true)
        }
        
        if myCurrency.isEmpty == true {
            initModel.forEach {
                realm.write($0.self)
            }
        }
    }
    
}
