//
//  Ex_Double.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/27/24.
//

import Foundation

extension Double {
    var FormattingToFirstDecimalPlace: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.1f",  self) : String(self)
    }
}
