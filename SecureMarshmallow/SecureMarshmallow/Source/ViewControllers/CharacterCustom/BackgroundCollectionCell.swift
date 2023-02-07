//
//  BackgroundCollectionCell.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/07.
//

import UIKit
import SnapKit

// Cell
class BackgroundCollectionCell: UICollectionViewCell {
    
    static let identifier = "BackgroundCollectionCell"
    
    var imageView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.layer.borderWidth = 3.0
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 55
        
    }
    
    var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 80.0, weight: .black)
        $0.text = ""
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                print("yes")
                imageView.layer.borderColor = UIColor.purple.cgColor
            } else {
                print("no")
                imageView.layer.borderColor = UIColor.gray.cgColor
            }
        }
    }
    
    
    func layout() {
        self.backgroundColor = .gray
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}

