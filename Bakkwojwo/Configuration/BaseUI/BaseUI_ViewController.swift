//
//  BaseUI_ViewController.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/3/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
        self.setAutoLayout()
    }
    
    /// 해당 ViewController를 셋업 합니다. (배경색상, UI 프로퍼티 할당 등)
    /// 기본 BackgroundColor는 white로 설정
    /// ```
    /// func setView() {
    ///     self.view.addSubview(label)
    ///     self.view.backgroundColor = .blue
    /// }
    func setView() {
        self.view.backgroundColor = .white
    }
    
    /// 해당 ViewController의 UI 프로퍼티의 AutoLayout(제약조건)을 셋업합니다.
    /// ```
    /// func setAutoLayout() {
    ///      self.label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
    /// }
    func setAutoLayout() {
        
    }
}
