//
//  completeViewController.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/07.
//

import UIKit
import SnapKit
import Then

class CompleteViewController: UIViewController {
    
    private lazy var backgroundView = UIView().then {
        $0.layer.cornerRadius = 100
    }
    
    private lazy var emojiCharacter = UILabel().then {
        $0.font = .systemFont(ofSize: 150.0, weight: .black)
        $0.text = ""
    }
    
    private lazy var welcomeTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .semibold)
        $0.text = "지은님 환영합니다"
    }
    
    private lazy var profileUpdateMessage = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.text = "2023.01.30 프로필 업데이트"
        $0.textColor = .separator

    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .black), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25
        $0.layer.borderWidth = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        backgroundView.backgroundColor = CharacterSelectionViewController.userBackground
        emojiCharacter.text = CharacterSelectionViewController.userEmoji
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        layout()
    }
    
    func layout() {
        [
            backgroundView,
            emojiCharacter,
            welcomeTitle,
            profileUpdateMessage,
            completeButton
        ].forEach { view.addSubview($0) }
        
        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(200.0)
        }
        
        emojiCharacter.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView.snp.centerY)
            $0.centerX.equalTo(backgroundView.snp.centerX)
        }
        
        welcomeTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backgroundView.snp.bottom).offset(75.0)
        }
        
        profileUpdateMessage.snp.makeConstraints {
            $0.centerX.equalTo(welcomeTitle.snp.centerX)
            $0.top.equalTo(welcomeTitle.snp.bottom).offset(10.0)
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(profileUpdateMessage.snp.bottom).offset(230.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(260.0)
            $0.height.equalTo(55.0)
        }
    }
    
    
}
