//
//  BackgroundView.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/07.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class BackgroundSelectionView: UIView {
    private final var controller: UIViewController
    var array = ["0","1","2","3","4","5","6","7","8"]
    let sectionInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    
    static var selectionBackground = UIColor()
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        collectionView.delegate = self
//        layout()
        
        let data = Observable<[String]>.of(self.array)
        
        data.asObservable()
            .bind(to: self.collectionView.rx
                .items(cellIdentifier: BackgroundCollectionCell.identifier, cellType: BackgroundCollectionCell.self)
            ) { index, recommend, cell in
                print("BackgroundCollectionCell 데이터불러오기 성공")
                cell.layout()
                cell.imageView.backgroundColor = .gray
                cell.layer.cornerRadius = 200

                if index == 0 {
                    cell.imageView.backgroundColor = .gray
                } else if index == 1 {
                    cell.imageView.backgroundColor = .black
                } else if index == 2 {
                    cell.imageView.backgroundColor = .orange
                } else if index == 3 {
                    cell.imageView.backgroundColor = .red
                } else if index == 4 {
                    cell.imageView.backgroundColor = .blue
                } else if index == 5 {
                    cell.imageView.backgroundColor = .yellow
                } else if index == 6 {
                    cell.imageView.backgroundColor = .green
                } else if index == 7 {
                    cell.imageView.backgroundColor = .systemPink
                } else{
                    cell.imageView.backgroundColor = .purple
                }
            }
        
        print("없음")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.register(BackgroundCollectionCell.self, forCellWithReuseIdentifier: BackgroundCollectionCell.identifier)
        return cv
    }()
    
    
//    func layout() {
//        controller.view.addSubview(collectionView)
//
//        collectionView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalToSuperview().inset(40)
//        }
//    }
}

extension BackgroundSelectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 10
        
        let width : CGFloat = (collectionView.bounds.width - 65 - itemSpacing * 2) / 3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)가 눌렸어")

            if indexPath.row == 0 {
                BackgroundSelectionView.selectionBackground = .gray
            } else if indexPath.row == 1 {
                BackgroundSelectionView.selectionBackground = .black
            } else if indexPath.row == 2 {
                BackgroundSelectionView.selectionBackground = .orange
            } else if indexPath.row == 3 {
                BackgroundSelectionView.selectionBackground = .red
            } else if indexPath.row == 4 {
                BackgroundSelectionView.selectionBackground = .blue
            } else if indexPath.row == 5 {
                BackgroundSelectionView.selectionBackground = .yellow
            } else if indexPath.row == 6 {
                BackgroundSelectionView.selectionBackground = .green
            } else if indexPath.row == 7 {
                BackgroundSelectionView.selectionBackground = .systemPink
            } else {
                BackgroundSelectionView.selectionBackground = .purple
            }
//            backgroundView.backgroundColor = userBackground
    }
}
