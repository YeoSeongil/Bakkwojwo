//
//  CalculatorViewController.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/11/24.
//

import UIKit
import SnapKit

class CalculatorViewController: BaseViewController {

    let testView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.bounds.size.height/2.3)
    }

    
    override func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.testView)
        
    }
    
    override func setAutoLayout() {
        self.testView.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3.0)
        }
    }
    
    



}
