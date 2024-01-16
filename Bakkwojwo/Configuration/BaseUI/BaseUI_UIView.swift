//
//  BaseUI_UIView.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/16/24.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// 해당 View를 셋업 합니다. (배경색상, UI 프로퍼티 할당 등)
    /// ```
    /// func setView() {
    ///     self.view.addSubview(label)
    ///     self.view.backgroundColor = .blue
    /// }
    func setView() {
    }
    
    /// 해당 View UI요소의  AutoLayout(제약조건)을 셋업합니다.
    /// ```
    /// func setAutoLayout() {
    ///      self.label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
    /// }
    func setAutoLayout() {
        
    }
}
