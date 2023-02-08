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
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5),
                      .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        seconedTextField.isSecureTextEntry = true
        seconedTextField.isUserInteractionEnabled = false
        seconedTextField.text = "아아아아아아"
        layout()
    }
    
    func layout() {
        [
            backgroundView,
            emojiCharacter,
            seconedTextField
        ].forEach { view.addSubview($0) }
        
        let width = view.frame.width / 430
        let height = view.frame.height / 932
        
        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(155.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(180.0 * height)
            $0.width.equalTo(180.0 * width)
        }
        
        emojiCharacter.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView.snp.centerY)
            $0.centerX.equalTo(backgroundView.snp.centerX)
        }
        
        seconedTextField.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.bottom).offset(80.0)
            $0.centerX.equalTo(view)
            $0.height.equalTo(50.0 * height)
            $0.width.equalTo(390.0 * width)
        }
    }
}
