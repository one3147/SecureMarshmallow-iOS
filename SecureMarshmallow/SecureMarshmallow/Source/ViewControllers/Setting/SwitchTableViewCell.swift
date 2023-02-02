//
//  SwichSettingTableViewCell.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/02.
//

import UIKit
import Then

class SwitchTableViewCell: UITableViewCell {
    static let identifier = "SwitchTableViewCell"
    
    private let iconContainer = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private let iconImageView = UIImageView().then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let label = UILabel().then {
        $0.numberOfLines = 1
    }
    
    private let mySwitch = UISwitch().then { $0.onTintColor = .systemBlue }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [label, iconContainer, mySwitch].forEach { contentView.addSubview($0) }
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 10, y: 6, width: size, height: size)
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        iconImageView.center = iconContainer.center
        
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - 10, y: (contentView.frame.size.height - mySwitch.frame.size.height)/2, width: mySwitch.frame.size.width, height: mySwitch.frame.size.height)
        
        label.frame = CGRect(x: 20 + iconContainer.frame.size.width, y: 0, width: contentView.frame.size.width - 20 - iconContainer.frame.size.width, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = false
    }
    
    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        mySwitch.isOn = model.isOn
    }
}
