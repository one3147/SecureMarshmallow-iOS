//
//  CharacterSelectionVIew.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/07.
//

import UIKit
import SnapKit

final class CharacterSelectionView: UIView {
    private final var controller: UIViewController
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        
        controller.view.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
