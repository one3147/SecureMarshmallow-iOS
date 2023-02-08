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
    
    var textFieldInputData: [String] = []
    
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
        
        layout()
        
        collectionView.delegate = self
        
        let data = Observable<[String]>.of(self.array)
        
        data.asObservable()
            .bind(to: self.collectionView.rx
                .items(cellIdentifier: NumberPasswordCollectionViewCell.identifier, cellType: NumberPasswordCollectionViewCell.self)
            ) { index, recommend, cell in
                print("NumberPasswordCollectionViewCell 데이터불러오기 성공")
                cell.layout()
                cell.imageView.backgroundColor = .black
                
                if index == 0 {
                    cell.numberLabel.text = "1"
                } else if index == 1 {
                    cell.numberLabel.text = "2"
                } else if index == 2 {
                    cell.numberLabel.text = "3"
                } else if index == 3 {
                    cell.numberLabel.text = "4"
                } else if index == 4 {
                    cell.numberLabel.text = "5"
                } else if index == 5 {
                    cell.numberLabel.text = "6"
                } else if index == 6 {
                    cell.numberLabel.text = "7"
                } else if index == 7 {
                    cell.numberLabel.text = "8"
                } else if index == 8{
                    cell.numberLabel.text = "9"
                }  else if index == 9 {
                    cell.numberLabel.font = .systemFont(ofSize: 30.0, weight: .semibold)
                    cell.numberLabel.text = "완료"
                } else if index == 10 {
                    cell.numberLabel.text = "0"
                } else {
                    cell.numberLabel.text = "<-"
                }
            }
        
        collectionView.reloadData()
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
            $0.leading.trailing.equalToSuperview().inset(25.0)
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
        print("\(indexPath.row)번 클릭")
        
        let index = indexPath.row
        if index == 0 {
//            self.seconedTextField.text = "1"
            textFieldInputData.append("1")
        } else if index == 1 {
            textFieldInputData.append("2")
        } else if index == 2 {
            textFieldInputData.append("3")
        } else if index == 3 {
            textFieldInputData.append("4")
        } else if index == 4 {
            textFieldInputData.append("5")
        } else if index == 5 {
            textFieldInputData.append("6")
        } else if index == 6 {
            textFieldInputData.append("7")
        } else if index == 7 {
            textFieldInputData.append("8")
        } else if index == 8{
            textFieldInputData.append("9")
        }  else if index == 9 {
            print("완료 버튼 클릭")
            print("\(seconedTextField.text!)")
        } else if index == 10 {
            textFieldInputData.append("0")
        } else {
            if textFieldInputData.isEmpty {
                print("값이 없음")
            } else {
                textFieldInputData.removeLast()
            }
        }
        let joinData = textFieldInputData.map { String($0) }.joined()
//        print(textFieldInputData)
//        print("joinData: \(joinData)")
        seconedTextField.text = joinData
    }
}
