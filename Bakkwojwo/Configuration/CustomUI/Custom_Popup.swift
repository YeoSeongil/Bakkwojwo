//
//  Custom_Popup.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/27/24.
//

import UIKit
import SnapKit

class Custom_Popup: BaseViewController {
    private var titleText: String?
    private var buttonText:String?
    private var messageText: String?

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var titleLabel: BaseLabel = {
        let label = BaseLabel(text: titleText!, textColor: .black, backgroundColor: .clear, font: .popUpTitle!)
        label.textAlignment = .center
       return label
    }()
    
    private lazy var messageLabel: BaseLabel = {
        let label = BaseLabel(text: messageText!, textColor: .gray, backgroundColor: .clear, font: .popUpMessage!)
        label.textAlignment = .center
       return label
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = .popUpButton
        return button
    }()
    
    convenience init(titleText: String? = nil, buttonText: String? = nil, messageText:String? = nil) {
        self.init()
        self.titleText = titleText
        self.buttonText = buttonText
        self.messageText = messageText
        modalPresentationStyle = .overFullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setView() {
        self.view.backgroundColor = .black.withAlphaComponent(0.2)
        self.view.addSubview(self.containerView)
        [self.titleLabel, self.messageLabel, self.actionButton].forEach {
            self.containerView.addSubview($0)
        }
    }
    
    override func setAutoLayout() {
        self.containerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(150)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
        self.messageLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
        }
        self.actionButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-15)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}

extension UIViewController {
    func showPopUp(titleText: String? = nil, message:String? = nil, buttonText:String? = nil) {
        let popUpVc = Custom_Popup(titleText: titleText, buttonText: buttonText, messageText:message)
        present(popUpVc, animated: false)
    }
}
