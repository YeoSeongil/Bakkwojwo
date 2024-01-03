//
//  BaseUI_UILabel.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/3/24.
//

import Foundation
import UIKit

class BaseTitleLabel: UILabel {
    /// ViewController의 Title을 지정하는 Label을 생성합니다.
    /// ```
    /// let titleLabel = BaseTitleLabel(titleText: "Home", titleColor: .black, titleBackgroundColor: .white)
    /// ```
    /// - Parameters:
    ///     - titleText: 라벨의 텍스트
    ///     - titleColor: 라벨의 텍스트 색상
    ///     - titleBackgroundColor: 라벨의 배경 색상
    init(titleText: String, titleColor:UIColor, titleBackgroundColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.text = titleText
        self.textColor = titleColor
        self.backgroundColor = titleBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
