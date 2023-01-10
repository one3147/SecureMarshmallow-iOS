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
import Lottie

class ErrorViewController: UIViewController {
    
    var lapCounter = 0
    var mainLapCounter = 0
    var lapTimer : Timer?
    var mainLapTimer : Timer?
    
    var userErrorCount = 3
    
    private let disposeBag = DisposeBag()
    internal var animationView: LottieAnimationView?
    
    private let errorTimer = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 40, weight: .bold)
    }
    
    private lazy var waitLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        $0.text = "누군가 회원님의 계정을 \(userErrorCount)회 입력했습니다\n 조금만 기다려주세요 \n (마쉬멜로는 개인정보를 고려합니다)"
        $0.numberOfLines = 0
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .ErrorColor
        self.view.addSubview(errorTimer)
        
        self.errorTimer.text = "00:00"
        startTimer()
        
        
        animationView = .init(name: "FireLottie")
                
        animationView!.loopMode = .loop
                
        animationView!.animationSpeed = 0.1
        
        animationView!.center = view.center
        
        animationView!.contentMode = .scaleAspectFill
                
        view.addSubview(animationView!)
        
        self.view.addSubview(waitLabel)
        
        self.animationView!.snp.makeConstraints {
            $0.top.equalToSuperview().offset(180.0)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(155)
        }
        
        self.errorTimer.snp.makeConstraints {
            $0.top.equalTo(animationView!.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
        }
        
        self.waitLabel.snp.makeConstraints {
            $0.top.equalTo(errorTimer.snp.bottom).offset(160.0)
            $0.centerX.equalToSuperview()
        }
        
        animationView!.play()
    }
    
    func startTimer(){
        if mainLapTimer == nil{
            mainLapTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mainLapTimerUpdate), userInfo: nil, repeats: true)
            RunLoop.current.add(mainLapTimer!, forMode: .common)
        }
        if lapTimer == nil{
            lapTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(lapTimerUpdate), userInfo: nil, repeats: true)
            RunLoop.current.add(lapTimer!, forMode: .common)
        }
    }


    func updateLabel( label : UILabel, counter : Int){
        let threeMinutes: Int = 10
        errorTimer.text = secondsToHourMinuteSecond(seconds: Int(threeMinutes - counter))
    }
    
    func secondsToHourMinuteSecond( seconds : Int )->String{
        let minute = seconds / 60 % 60
        let second = seconds % 60
        
        if minute == 0 && second == 0 {
            // 나중에 뷰추가 후 수정
            print("비밀번호 호출 이벤트")
            lapTimer?.invalidate()
            mainLapTimer?.invalidate()
        }
        
        return String(format: "%02i:%02i", minute, second )
    }
    
    
    @objc func mainLapTimerUpdate(){
        mainLapCounter += 1
        updateLabel(label: errorTimer, counter: mainLapCounter)
    }
    
    @objc func lapTimerUpdate(){
        lapCounter += 1
    }
    
    
    func attributes() {
        
    }
    
    //    private func setupPossibleBackgroundTimer() {
    //        let startTime = Date()
    //
//            let threeMinutes: Int = 180
    //
    //        let timer = Observable<Int>.interval(
    //            .seconds(1),
    //            scheduler: MainScheduler.instance
    //        )
    //        timer.withUnretained(self)
    //            .do(onNext: { weakSelf, countValue in
    //                let elapseSeconds = Date().timeIntervalSince(startTime)
    //                weakSelf.errorTimer.text = "\(threeMinutes - Int(elapseSeconds))분"
    //            })
    //                .subscribe()
    //                .disposed(by: disposeBag)
    //    }lottieMove
}
