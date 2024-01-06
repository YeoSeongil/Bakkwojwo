//
//  ApiItemModel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/2/24.
//

import Foundation

struct ApiItemModel: Codable {
    let code: String // Query Params Value, ex)FRX.KRWUSD, FRX.KRWJPY
    let currencyCode: String // 통화코드 ex) USD, JPY, KRW
    let currencyName: String? // 통화이름 ex) 달러, 엔, 위안, 유로
    let country: String? // 나라이름 ex) 미국, 대한민국, 중국
    let name: String? // 요청코드 ex) 미국(USD/KRW)
    let date: String // 갱신 날짜 ex) 2024-01-02
    let time: String // 갱신 시간 ex) 21:03:32
    let recurrenceCount: Int
    let basePrice: Double // 매매 기준율 ex) 1310.00
    let openingPrice: Double // ex) 1289.40
    let highPrice: Double // ex) 1310.00
    let lowPrice: Double // ex) 1289.40
    let change:String // 전일대비 증감 ex) RISE, FALL
    let changePrice: Double // 부호 없는 가격변동 ex) 11.00
    let cashBuyingPrice: Double // 구매시 가격 ex) 1332.92
    let cashSellingPrice: Double // 판매시 가격 ex) 1287.08
    let ttBuyingPrice: Double? // 전신환매입율(손님이 해외송금 받을 때 가격) ex) 1297.20
    let ttSellingPrice: Double? // 전신환매도율(손님이 해외송금 보낼 때 가격) ex) 1322.80
    let tcBuyingPrice: Double?
    let fcSellingPrice: Double?
    let exchangeCommission : Double
    let usDollarRate: Double
    let high52wPrice: Double // 52주 신고가(52주 간 최대 가격) ex) 1363.50
    let high52wDate: String // 52주 신고가 달성일(52주 간 최대 가격 달성일) ex) 2023-10-04
    let low52wPrice: Double // 52주 신저가(52주 간 최저 가격) ex) 1216.60
    let low52wDate: String // 52주 신저가 달성일(52주 간 최저 가격 달성일) ex) 2023-02-02
    let currencyUnit: Int
    let provider: String?
    let timestamp: Int
    let id: Int
    let modifiedAt: String
    let createdAt: String
    let changeRate: Double
    let signedChangeRate: Double // 부호 있는 가격변동율 ex) 0.008468023 x 100 해줘야 함.
    let signedChangePrice: Double
}
