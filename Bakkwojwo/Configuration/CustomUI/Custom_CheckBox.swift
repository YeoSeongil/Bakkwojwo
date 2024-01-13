//
//  Custom_CheckBox.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/13/24.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    
    var isChecked: Bool = false {
        didSet {
            self.setImage()
            tapped()
        }
    }
    
    var tapped: () -> Void = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage()
        self.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton() {
        self.backgroundColor = .clear
        self.setImage(UIImage(systemName: "square"), for: .normal)
        self.tintColor = .black
        self.setTitleColor(.black, for: .normal)
    }
    
    @objc func checkBoxTapped(_ sender: UIGestureRecognizer) {
        isChecked.toggle()
    }
    
    private func setImage() {
        if isChecked == true {
            self.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
}
