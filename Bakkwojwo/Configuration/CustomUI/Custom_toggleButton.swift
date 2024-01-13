//
//  Custom_toggleButton.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/13/24.
//

import Foundation
import UIKit

class ToggleButton: UIButton {
    var offTitle: String = ""
    var onTitle: String = ""
    
    var isChecked: Bool = false {
        didSet {
            self.setTitle()
            onUpdated()
        }
    }
    
    var onUpdated: () -> Void = {}
    
    init(offTitle: String, onTitle: String, titleColor:UIColor, backgroundColor: UIColor, font: UIFont) {
        super.init(frame: CGRect.zero)
        self.setTitle(offTitle, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.offTitle = offTitle
        self.onTitle = onTitle
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
    
    private func setTitle() {
        if isChecked == true {
            self.setTitle(self.onTitle, for: .normal)
        } else {
            self.setTitle(self.offTitle, for: .normal)
        }
    }
}
