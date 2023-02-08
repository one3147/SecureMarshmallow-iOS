//
//  RadioButton.swift
//  Pods
//
//  Created by 박준하 on 2023/02/06.
//

import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    override func awakeFromNib() {
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton() {
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = .white
//                self.layer.borderColor = UIColor.red.cgColor
                self.setTitleColor(.darkGray, for: .normal)
            } else {
                self.backgroundColor = .darkGray
//                self.layer.borderColor = UIColor.blue.cgColor
                self.setTitleColor(.white, for: .normal)
            }
        }
    }
}
