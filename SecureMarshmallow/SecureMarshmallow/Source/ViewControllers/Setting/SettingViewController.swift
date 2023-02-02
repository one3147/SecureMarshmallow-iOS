//
//  SettingViewController.swift
//  SecureMarshmallow
//
//  Created by 박준하 on 2023/02/02.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingOption]
}

struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        configure()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Section(title: "General", options: [
            SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                
            },
            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            },
            SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            },
        ]))
        
        models.append(Section(title: "Information", options: [
            SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                
            },
            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            },
            SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            },
        ]))
        
        models.append(Section(title: "Apps", options: [
            SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                
            },
            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            },
            SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            },
            SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            },
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row].options[indexPath.row]
        model.handler()
    }
}
