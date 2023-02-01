//
//  ErrorPresenter.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/01.
//

import UIKit

protocol ErrorProtocol {
    func setupViews()
//    func animationViewEvent()
    func startTimer()
//    func attributes()
}

final class ErrorPresenter: NSObject {
    private let viewController: ErrorProtocol
    
    init(viewController:
            ErrorProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
//        viewController.animationViewEvent()
//        viewController.attributes()
    }
    
    func viewDidAppear() {
//        viewController.attributes()
        viewController.startTimer()
    }
    
    func viewDidLayoutSubviews() {
        viewController.setupViews()
    }
}
