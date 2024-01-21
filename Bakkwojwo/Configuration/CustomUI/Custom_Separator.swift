//
//  Custom_Separator.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/21/24.
//

import UIKit
import SnapKit

class Custom_Separator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView() {
        self.backgroundColor = .clear
        self.tintColor = .black
        self.layer.borderWidth = 1
    }
    
    func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(1)
        }
    }

}
