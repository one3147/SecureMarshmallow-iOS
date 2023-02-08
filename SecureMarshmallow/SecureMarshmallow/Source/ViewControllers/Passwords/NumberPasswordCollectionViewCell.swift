//
//  NumberPasswordCollectionViewCell.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/08.
//

import UIKit
import SnapKit

class NumberPasswordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NumberPasswordCollectionViewCell"
    
    var imageView = UIView().then {
        $0.backgroundColor = .black
    }
    
    var numberLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 40.0, weight: .black)
        $0.text = ""
    }
    
    func layout() {
        self.backgroundColor = .gray
        self.addSubview(imageView)
        self.addSubview(numberLabel)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        numberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
