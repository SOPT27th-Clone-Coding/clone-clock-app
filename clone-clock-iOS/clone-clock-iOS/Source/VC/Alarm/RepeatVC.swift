//
//  RepeatVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/11.
//

import UIKit

class RepeatVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var weeksData : [(date: String, selected: Bool)] = [("월", false), ("화", false), ("수", false), ("목", false), ("금", false), ("토", false), ("일", false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension RepeatVC {
    func setView() {
        tableView.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        tableView.separatorColor = .gray
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.tableFooterView?.backgroundColor = .clear
    }
}

extension RepeatVC :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weeksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(weeksData[indexPath.row].date)요일마다"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .darkGray
        
        return cell
    }
}

extension RepeatVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        cell.tintColor = .orange
        
        let week = weeksData[indexPath.row]
        weeksData.remove(at: indexPath.row)
        weeksData.insert((week.date, !week.selected), at: indexPath.row)
        
        if week.selected {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
}
