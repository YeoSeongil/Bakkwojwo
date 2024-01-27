//
//  CountryModel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/2/24.
//

import Foundation

struct CountryModel: Codable {
    let countryName: String
    let currencyUnit: String
}

let countryNameItem: [String] = ["USD", "JPY", "CNY", "EUR", "GBP", "RUB", "HKD", "THB", "TWD", "PHP", "SGD", "VND", "MYR", "MNT", "BHD", "BDT", "BND", "SAR", "LKR", "AED", "OMR", "JOD", "ILS", "INR", "IDR", "QAR", "KZT", "KWD", "PKR", "AUD", "NZD", "CAD", "MXN", "BRL", "CLP", "COP", "ZAR", "NOK", "DKK", "SEK", "CHF", "CZK", "TRY", "PLN", "HUF", "DZD", "EGP", "KES", "TZS"]

let countryModelItem: [String: CountryModel] = [
    // Asia
    "KRW" : CountryModel(countryName: "대한민국", currencyUnit: "원(₩)"),
    "JPY" : CountryModel(countryName: "일본", currencyUnit: "100엔(￥)"),
    "CNY" : CountryModel(countryName: "중국", currencyUnit: "위안(¥)"),
    "HKD" : CountryModel(countryName: "홍콩", currencyUnit: "달러(HK$)"),
    "THB" : CountryModel(countryName: "태국", currencyUnit: "바트(฿)"),
    "TWD" : CountryModel(countryName: "대만", currencyUnit: "달러(NT$)"),
    "PHP" : CountryModel(countryName: "필리핀", currencyUnit: "페소(₱)"),
    "SGD" : CountryModel(countryName: "싱가포르", currencyUnit: "달러(S$)"),
    "VND" : CountryModel(countryName: "베트남", currencyUnit: "동(₫)"),
    "MYR" : CountryModel(countryName: "말레이시아", currencyUnit: "링깃(RM)"),
    "MNT" : CountryModel(countryName: "몽골", currencyUnit: "투그릭(₮)"),
    "BHD" : CountryModel(countryName: "바레인", currencyUnit: "디나르(د. ج)"),
    "BDT" : CountryModel(countryName: "방글라데시", currencyUnit: "타카(৳)"),
    "BND" : CountryModel(countryName: "브루나이", currencyUnit: "달러(BN$)"),
    "SAR" : CountryModel(countryName: "사우디아라비아", currencyUnit: "리얄(﷼)"),
    "LKR" : CountryModel(countryName: "스리랑카", currencyUnit: "루피(රු)"),
    "AED" : CountryModel(countryName: "아랍에미리트공화국", currencyUnit: "디르함(د.إ)"),
    "OMR" : CountryModel(countryName: "오만", currencyUnit: "리얄(ر. ع.)"),
    "JOD" : CountryModel(countryName: "요르단", currencyUnit: "디나르(د. ج)"),
    "ILS" : CountryModel(countryName: "이스라엘", currencyUnit: "셰켈(₪)"),
    "INR" : CountryModel(countryName: "인도", currencyUnit: "루피(₹)"),
    "IDR" : CountryModel(countryName: "인도네시아", currencyUnit: "루피아(Rp)"),
    "QAR" : CountryModel(countryName: "카타르", currencyUnit: "리얄(ر.ق)"),
    "KZT" : CountryModel(countryName: "카자흐스탄", currencyUnit: "텡게(₸)"),
    "KWD" : CountryModel(countryName: "쿠웨이트", currencyUnit: "디나르(د.ك)"),
    "PKR" : CountryModel(countryName: "파키스탄", currencyUnit: "루피(Rs)"),
    
    // Oceania
    "AUD" : CountryModel(countryName: "호주", currencyUnit: "달러(AU$)"),
    "NZD" : CountryModel(countryName: "뉴질랜드", currencyUnit: "달러(NZ$)"),
    
    // America
    "USD" : CountryModel(countryName: "미국", currencyUnit: "달러($)"),
    "CAD" : CountryModel(countryName: "캐나다", currencyUnit: "달러(CAN$)"),
    "MXN" : CountryModel(countryName: "멕시코", currencyUnit: "페소(MEX$)"),
    "BRL" : CountryModel(countryName: "브라질", currencyUnit: "헤알(R$)"),
    "CLP" : CountryModel(countryName: "칠레", currencyUnit: "페소(CLP$)"),
    "COP" : CountryModel(countryName: "콜롬비아", currencyUnit: "페소(COL$)"),
    
    // Europe
    "GBP" : CountryModel(countryName: "영국", currencyUnit: "파운드(£)"),
    "RUB" : CountryModel(countryName: "러시아", currencyUnit: "루블(₽)"),
    "NOK" : CountryModel(countryName: "노르웨이", currencyUnit: "크로네(kr)"),
    "DKK" : CountryModel(countryName: "덴마크", currencyUnit: "크로네(kr)"),
    "SEK" : CountryModel(countryName: "스웨덴", currencyUnit: "크로나(kr)"),
    "CHF" : CountryModel(countryName: "스위스", currencyUnit: "프랑(₣)"),
    "CZK" : CountryModel(countryName: "체코", currencyUnit: "코루나(Kč)"),
    "TRY" : CountryModel(countryName: "터키", currencyUnit: "리라(₺)"),
    "PLN" : CountryModel(countryName: "폴란드", currencyUnit: "즈워티(zł)"),
    "HUF" : CountryModel(countryName: "헝가리", currencyUnit: "포린트(Ft)"),
    "EUR" : CountryModel(countryName: "유럽연합", currencyUnit: "유로(€)"),
    
    // Africa
    "DZD" : CountryModel(countryName: "알제리", currencyUnit: "디나르(د. ج)"),
    "EGP" : CountryModel(countryName: "이집트", currencyUnit: "파운드(E£)"),
    "KES" : CountryModel(countryName: "케냐", currencyUnit: "실링(KSh)"),
    "TZS" : CountryModel(countryName: "탄자니아", currencyUnit: "실링(TSh)"),
    "ZAR" : CountryModel(countryName: "남아프리카공화국", currencyUnit: "랜드(R)"),
]
