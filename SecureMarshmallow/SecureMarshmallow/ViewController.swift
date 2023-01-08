//
//  ViewController.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/01/06.
//

import UIKit
import RxSwift
import SnapKit
import Then

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let errorTimer = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 40, weight: .bold)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .ErrorColor
        self.view.addSubview(errorTimer)
        
        self.errorTimer.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.setupPossibleBackgroundTimer()
    }
    
//    private func setupPossibleBackgroundTimer() {
//        let startTime = Date()
//
//        let timer = Observable<Int>.interval(
//            .seconds(1),
//            scheduler: MainScheduler.instance
//        )
//        timer.withUnretained(self)
//            .do(onNext: { weakSelf, countValue in
//                let elapseSeconds = Date().timeIntervalSince(startTime)
//                weakSelf.errorTimer.text = "\(Int(elapseSeconds))초"
//            })
//                .subscribe()
//                .disposed(by: disposeBag)
//    }
    
    private func setupPossibleBackgroundTimer() {
//        let startTime = Date()
        
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        
        
//        let timer = Observable<Int>.interval(
//            .seconds(1),
//            scheduler: MainScheduler.instance
//        )
//        timer.withUnretained(self)
//            .do(onNext: { weakSelf, countValue in
//                let elapseSeconds = Date().timeIntervalSince(startTime)
//                weakSelf.errorTimer.text = "\(Int(elapseSeconds))초"
//            })
//                .subscribe()
//                .disposed(by: disposeBag)
    }
}
