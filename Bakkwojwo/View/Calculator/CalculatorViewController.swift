//
//  CalculatorViewController.swift
//  Bakkwojwo
//
//  Created by 여성일 on 1/11/24.
//

import UIKit
import SnapKit

class CalculatorViewController: BaseViewController {
    
    private var operArr = [String]()
    let CalculatorKey = CalculatorView()
    let CalculatorResult  = CalculatorResultView()
    let calViewModel = CalculatorViewModel()
    let exViewModel = ExchangeRateViewModel()
    let separatorBar = Custom_Separator()
    
    private let mainSectionTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "환율 계산기", textColor: .black, backgroundColor: .white, font: .mainTitle2!)
        return label
    }()
    
    private let mainSectionSubTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .darkGray, backgroundColor: .white, font: .subTitle!)
        return label
    }()
    
    private let calculatorExchangeRateSectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CalculatorExchangeRateListCollectionViewCell.self, forCellWithReuseIdentifier: CalculatorExchangeRateListCollectionViewCell.registerId)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CalculatorKey.delegate = self
        self.exViewModel.dataLoad()
    }
    
    override func setView() {
        self.view.backgroundColor = .white
        [self.mainSectionTitleLabel, self.mainSectionSubTitleLabel, self.calculatorExchangeRateSectionCollectionView, self.CalculatorKey, self.CalculatorResult, self.separatorBar].forEach { self.view.addSubview($0)}
    }
    
    override func setAutoLayout() {
        self.mainSectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        self.mainSectionSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainSectionTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        self.calculatorExchangeRateSectionCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.mainSectionSubTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalTo(self.separatorBar.snp.top).offset(-15)
        }
        
        self.separatorBar.snp.makeConstraints {
            $0.top.equalTo(self.calculatorExchangeRateSectionCollectionView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        self.CalculatorResult.snp.makeConstraints {
            $0.top.equalTo(self.separatorBar.snp.top)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 13.0)
            $0.bottom.equalTo(self.CalculatorKey.snp.top)
        }

        self.CalculatorKey.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 3.0)
        }
    }
    
    override func bind() {
        self.calViewModel.onInputViewUpdated = { [weak self] in
            guard let self = self else { return }
            self.CalculatorResult.inputKeyValueView.text = self.calViewModel.currentInputViewString
        }
        
        self.calViewModel.onResultViewUpdated =  { [weak self] in
            guard let self = self else { return }
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let result: String = formatter.string(from: NSNumber(value: Double(self.calViewModel.currentResultString)!))!
            self.CalculatorResult.calculateResultView.text = "\(result)원"
        }
        
        self.exViewModel.onUpdated = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.exViewModel.dataLoad()
                self.mainSectionSubTitleLabel.text = "\(self.exViewModel.exchangeRateModel[0].date) \(self.exViewModel.exchangeRateModel[0].time)"
                self.calculatorExchangeRateSectionCollectionView.delegate = self
                self.calculatorExchangeRateSectionCollectionView.dataSource = self
                self.calculatorExchangeRateSectionCollectionView.reloadData()
            }
        }
    }
}

extension CalculatorViewController: CalculatorViewDelegate {
    func tappedKey(_ k: String)  {
        self.calViewModel.numberKeyTapped(k)
    }
    
    func tappedOper(_ k: String) {
        self.calViewModel.operatorKeyTapped(k)
    }
}

extension CalculatorViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width
        let hegiht: CGFloat = 50
        return CGSize(width: width, height: hegiht)
    }
}

extension CalculatorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.exViewModel.exchangeRateModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorExchangeRateListCollectionViewCell.registerId, for: indexPath) as? CalculatorExchangeRateListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = self.exViewModel.exchangeRateModel[indexPath.row]
        cell.setData(data)
        
        let calcData: Double = Double(self.calViewModel.currentResultString)! / data.basePrice
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let result: String = formatter.string(from: NSNumber(value: calcData))!
        if data.currencyCode == "JPY" {
            let jpyCalc: String = formatter.string(from: NSNumber(value: calcData * 100))!
            cell.basePriceLabel.text = "\(jpyCalc)\(data.currencyName)"
        } else {
            cell.basePriceLabel.text = "\(result)\(data.currencyName)"
        }
        return cell
    }
}
