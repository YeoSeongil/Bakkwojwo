//
//  Ex_UIFont.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/3/24.
//

import Foundation
import UIKit

extension UIFont {
    enum Pretendard: String {
        case thin = "Pretendard-Thin"
        case light = "Pretendard-Light"
        case medium = "Pretendard-Medium"
        case regular = "Pretendard-Regular"
        case bold = "Pretendard-Bold"
    }
}

extension UIFont {
    static let mainTitle = UIFont(name: Pretendard.bold.rawValue, size: 27)
    static let subTitle = UIFont(name: Pretendard.thin.rawValue, size: 15)
    

    static let h2 = UIFont(name: Pretendard.medium.rawValue, size: 20)
    static let h3 = UIFont(name: Pretendard.light.rawValue, size: 15)
    static let h4 = UIFont(name: Pretendard.light.rawValue, size: 10)
}
