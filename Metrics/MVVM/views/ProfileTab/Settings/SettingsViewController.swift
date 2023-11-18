//
//  SettingsViewController.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 26/02/23.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: Settingsoption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption{
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()-> Void)
    let isOn: Bool
}

struct Settingsoption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        // Do any additional setup after loading the view.
    }
    
    func configure(){
        models.append(Section(title: "General", options: [
            .switchCell(model: SettingsSwitchOption(title: "Dark Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed, handler: {
                
                
            }, isOn: true)),
            .staticCell(model: Settingsoption(title: "Location Access", icon: UIImage(systemName: "location"), iconBackgroundColor: .black){
                
            }),
        
            SettingsOptionType
            .staticCell(model: Settingsoption(title: "Developer Mode", icon: UIImage(systemName: "flag"), iconBackgroundColor: .systemGreen){
                
            }),
        
            .staticCell(model: Settingsoption(title: "Tell a Friend", icon: UIImage(systemName: "heart"), iconBackgroundColor: .systemOrange){
                
            })
            
        ]))
        
        models.append(Section(title: "About", options: [
            .staticCell(model: Settingsoption(title: "Rate us on App Store", icon: UIImage(systemName: "people.2"), iconBackgroundColor: .systemPink){
                print("Tapped first cell")
                
            }),
            .staticCell(model: Settingsoption(title: "Privacy Policy", icon: UIImage(systemName: "lock"), iconBackgroundColor: .link){
                
            }),
            
                .staticCell(model: Settingsoption(title: "Community Guidlines", icon: UIImage(systemName: "like"), iconBackgroundColor: .systemGreen){
                    
                }),
            
            SettingsOptionType
                .staticCell(model: Settingsoption(title: "Delete Metrics Account", icon: UIImage(systemName: "trash"), iconBackgroundColor: .systemGreen){
                    
                }),
            
                .staticCell(model: Settingsoption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
                    
                })
            
        ]))

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
        }
        
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
            
        case .staticCell(let model):
            model.handler()
            
        case .switchCell(let model):
            model.handler()
        }
    }

}
