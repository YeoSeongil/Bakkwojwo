//
//  Custom_CalculatorKey.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/16/24.
//

import Foundation
import UIKit

class CalculatorKey: UIButton {
    
    init(keyTitle: String) {
        super.init(frame: CGRect.zero)
        self.setTitle(keyTitle, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .clear
        self.titleLabel?.font = .h5!
        self.addTarget(self, action: #selector(keyTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func keyTapped(_ sender: UIButton) {
        guard let symbol = sender.currentTitle else { return }
        print(symbol)
    }
}
