//
//  ViewController.swift
//  Bakkwojwo
//
//  Created by 여성일 on 2024/01/01.
//

import UIKit
import SnapKit

class ExchangeRateViewController: BaseViewController{
    let refreshControl = UIRefreshControl()
    
    let viewModel = ExchangeRateViewModel()
   
    let BaseCurrency = BaseCurrencyView()
    let Division = ExchangeRateDivisionView()
    
    var isCheckedArray: [Bool] = []

    private let mainSectionTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "국가별 환율", textColor: .black, backgroundColor: .white, font: .mainTitle2!)
        return label
    }()
    
    private let mainSectionSubTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "Loading..", textColor: .darkGray, backgroundColor: .white, font: .subTitle!)
        return label
    }()
    
    private let baseCurrencySectionTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "기준 통화", textColor: .black, backgroundColor: .white, font: .h2!)
        return label
    }()
    
    private let exchangeRateSectionTitleLabel: BaseLabel = {
        let label = BaseLabel(text: "현재 환율", textColor: .black, backgroundColor: .white, font: .h2!)
        return label
    }()
    
    private let exchangeRateSectionEditButton: ToggleButton = {
        let button = ToggleButton(offTitle: "편집", onTitle: "완료", titleColor: .black, backgroundColor: .clear, font: .h3!)
        return button
    }()
    
    private let exchangeRateSectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ExchangeRateSectionCollectionViewCell.self, forCellWithReuseIdentifier: ExchangeRateSectionCollectionViewCell.registerId)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initRefresh()
        self.exchangeReateSectionEditButtonToggle()
    }

    override func setView() {
        self.view.backgroundColor = .white
        [self.mainSectionTitleLabel, self.mainSectionSubTitleLabel, self.BaseCurrency, self.baseCurrencySectionTitleLabel, self.exchangeRateSectionTitleLabel, self.exchangeRateSectionEditButton, self.exchangeRateSectionCollectionView, self.Division].forEach {
            self.view.addSubview($0)
        }
    }
    
   override func bind() {
        self.viewModel.onUpdated = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainSectionSubTitleLabel.text = "\(self.viewModel.exchangeRateModel[0].date) \(self.viewModel.exchangeRateModel[0].time)"
                self.exchangeRateSectionCollectionView.delegate = self
                self.exchangeRateSectionCollectionView.dataSource = self
                self.exchangeRateSectionCollectionView.reloadData()
                self.isCheckedArray = self.viewModel.exchangeRateModel.map {
                            $0.isChecked
                }
            }
        }
    }
    
    private func exchangeReateSectionEditButtonToggle() {
        self.exchangeRateSectionEditButton.onUpdated = { [weak self] in
            guard let self = self else {return}
            if self.exchangeRateSectionEditButton.isChecked == false {
                self.viewModel.myCurrencyUpdate(isCheckedArray, onError: {
                    self.showPopUp(titleText: "오류", message: "한 개 이상의 국가는 반드시 체크해야 합니다.", buttonText: "확인")
                })
                self.viewModel.dataLoad()
            } else {
                self.viewModel.allDataLoad()
            }
        }
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
        
        self.BaseCurrency.snp.makeConstraints {
            $0.top.equalTo(self.mainSectionSubTitleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-100)
            $0.height.equalTo(100)
        }
        
        self.exchangeRateSectionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.BaseCurrency.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-100)
        }
        
        self.exchangeRateSectionEditButton.snp.makeConstraints {
            $0.top.equalTo(self.BaseCurrency.snp.bottom).offset(10)
            $0.leading.equalTo(self.exchangeRateSectionTitleLabel.snp.trailing).offset(15)
            $0.trailing.equalToSuperview()
        }
        
        self.Division.snp.makeConstraints {
            $0.top.equalTo(self.exchangeRateSectionTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(15)
        }
        
        self.exchangeRateSectionCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.Division.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    func initRefresh() {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.exchangeRateSectionCollectionView.refreshControl = refreshControl
    }

    @objc func refresh(refresh: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if self.exchangeRateSectionEditButton.isChecked == true {
                self.viewModel.allDataLoad()
            } else {
                self.viewModel.dataLoad()
            }
            refresh.endRefreshing()
        }
    }
}

extension ExchangeRateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width
        let hegiht: CGFloat = 50
        return CGSize(width: width, height: hegiht)
    }
}

extension ExchangeRateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.exchangeRateModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExchangeRateSectionCollectionViewCell.registerId, for: indexPath) as? ExchangeRateSectionCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = self.viewModel.exchangeRateModel[indexPath.row]
        cell.isHiddenAnimation(state: self.exchangeRateSectionEditButton.isChecked)
        cell.setData(data)
        cell.delegate = self

        cell.checkBox.isChecked = self.isCheckedArray[indexPath.row] == true ? true : false
        return cell
    }
}

extension ExchangeRateViewController: ExchangeRateSectionCollectionViewDelegate {
    func checkBoxButtonTapped(_ cell: ExchangeRateSectionCollectionViewCell, _ button: CheckBox) {
        guard let indexPath = self.exchangeRateSectionCollectionView.indexPath(for: cell) else { return }
        
        isCheckedArray[indexPath.row] = button.isChecked == true ? true : false
    }
}
