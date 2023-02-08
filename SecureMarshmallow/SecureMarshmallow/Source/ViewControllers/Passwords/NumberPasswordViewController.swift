//
//  NumberPasswordViewController.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/08.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Then

final class NumberPasswordViewController: UIViewController {
    
    var array = ["0","1","2","3","4","5","6","7","8","9","10","11"]
    let cellMarginSize: CGFloat = 10.0
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5),
                      .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    private lazy var backgroundView = UIView().then {
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 90 * (view.frame.width / 430)
    }
    
    private lazy var emojiCharacter = UILabel().then {
        $0.font = .systemFont(ofSize: 150.0, weight: .black)
        $0.text = "🦁"
    }
    
    internal lazy var seconedTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 50.0, weight: .bold)
    }
    
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.register(NumberPasswordCollectionViewCell.self, forCellWithReuseIdentifier: NumberPasswordCollectionViewCell.identifier)
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        seconedTextField.isSecureTextEntry = true
        seconedTextField.isUserInteractionEnabled = false
        seconedTextField.text = "아아아아아아"
        layout()
        
        collectionView.delegate = self
        
        let data = Observable<[String]>.of(self.array)
        
        data.asObservable()
            .bind(to: self.collectionView.rx
                .items(cellIdentifier: NumberPasswordCollectionViewCell.identifier, cellType: NumberPasswordCollectionViewCell.self)
            ) { index, recommend, cell in
                print("NumberPasswordCollectionViewCell 데이터불러오기 성공")
                cell.layout()
                cell.imageView.backgroundColor = .gray
            }
    }
    
    func layout() {
        [
            backgroundView,
            emojiCharacter,
            seconedTextField,
            collectionView
        ].forEach { view.addSubview($0) }
        
        let width = view.frame.width / 430
        let height = view.frame.height / 932
        
        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(180.0 * height)
            $0.width.equalTo(180.0 * width)
        }
        
        emojiCharacter.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView.snp.centerY)
            $0.centerX.equalTo(backgroundView.snp.centerX)
        }
        
        seconedTextField.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.bottom).offset(40.0)
            $0.centerX.equalTo(view)
            $0.height.equalTo(50.0 * height)
            $0.width.equalTo(390.0 * width)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(seconedTextField.snp.bottom).offset(70.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(98)
        }
    }
}

extension NumberPasswordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = self.cellMarginSize
        let availableWidth = width - spacing * (numberOfItemsPerRow + 10)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)

        return CGSize(width: itemDimension, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)가 눌렸어")
    }
}
