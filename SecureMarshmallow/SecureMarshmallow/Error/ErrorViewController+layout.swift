//
//  ErrorViewController+layout.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/01/10.
//

import UIKit
import SnapKit

extension ErrorViewController {
    
    func layout() {
        animationView?.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120.0)
            $0.leading.equalToSuperview().inset(150.0)
        }
    }
}
