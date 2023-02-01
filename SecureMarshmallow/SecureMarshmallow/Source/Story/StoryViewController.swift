import UIKit
import SnapKit
import RxFlow
import RxRelay
import RxCocoa
import RxSwift

class StoryViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    internal var logoImageView = UIImageView().then {
        let imageName = "MarshmallowLogo"
        $0.image = UIImage(named: imageName)
    }
    
    internal var stratLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "안녕하세요 마쉬멜로입니다.\n몇가지 유의사항 및 안내 드리겠습니다."
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    internal var okButton = UIButton().then {
        $0.setTitle("넵! 알겠습니다!", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .black), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25.0
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        view.backgroundColor = .black
        
        okButton.rx.tap
            .bind {
                print("넵! 알겠습니다!")
            }.disposed(by: disposeBag)
    }
    
    func layout() {
        [
            logoImageView,
            stratLabel,
            okButton
        ].forEach { view.addSubview($0) }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(130.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(150.0)
        }
        
        stratLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(155)
            $0.centerX.equalToSuperview()
        }
        
        okButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(stratLabel.snp.bottom).offset(255.0)
            $0.height.equalTo(55.0)
            $0.width.equalTo(260.0)
        }
    }
}
