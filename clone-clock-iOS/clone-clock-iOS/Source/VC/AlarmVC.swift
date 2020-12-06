//
//  AlarmVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class AlarmVC: UIViewController {
    @IBOutlet weak var alarmTableView: UITableView!
    
    var alarmData: [AlarmModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        alarmTableView.dataSource = self
        alarmTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if(editing && !alarmTableView.isEditing){
            alarmTableView.setEditing(true, animated: true)
            editButtonItem.title = "완료"
        }else{
            alarmTableView.setEditing(false, animated: true)
            editButtonItem.title = "편집"
        }
    }
}

extension AlarmVC {
    func setView() {
        alarmTableView.backgroundColor = .black
        alarmTableView.separatorColor = .darkGray
        alarmTableView.tableFooterView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 0))
        alarmTableView.tableFooterView?.backgroundColor = .clear
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        plusButton.tintColor = .systemOrange
        
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.tintColor = .systemOrange
        editButtonItem.title = "편집"
        navigationItem.rightBarButtonItem = plusButton
        
        // navigation bar
        self.navigationController?.navigationBar.setItems([navigationItem], animated: true)
        self.navigationController?.navigationBar.topItem?.title = .none
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        // large title
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeContentTitle = "알람"
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35),
            NSAttributedString.Key.foregroundColor : UIColor.brown
        ]
        
    }
}

extension AlarmVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            //            return alarmData.count
            return 10
        default:
            return 3
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            guard let cell = alarmTableView.dequeueReusableCell(withIdentifier: "SleepCell", for: indexPath) as? SleepCell else {
                return UITableViewCell()
            }
            cell.setCell()
            
            return cell
        } else {
            guard let cell = alarmTableView.dequeueReusableCell(withIdentifier: "AlarmCell") as? AlarmCell else {return UITableViewCell()}
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "수면 | 기상"
        default:
            return "기타"
        }
    }
}

extension AlarmVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if (indexPath.section == 0) {
            return nil
        }
        
        return indexPath
    }
}
