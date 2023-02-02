//
//  SettingPresenter.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/02.
//

//
//protocol SettingProtocol { }
//
//final class SettingPresenter: NSObject {
//    private let viewController = SettingProtocol
//
//    init(viewController:
//            SettingProtocol) {
//        self.viewController = viewController
//    }
//
//    func viewDidLoad() { }
//
//    func viewWillAppear() { }
//
//    func didTapRightBarButtonItem() { }
//}

import UIKit

protocol SettingProtocol{ }

final class SettingPresenter: NSObject {
    private let viewController: SettingProtocol
    
    init(viewController:
         SettingProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
    }
    
    func viewWillAppear() {
    }
    
    func didTapRightBarButtonItem() {
    }
}
