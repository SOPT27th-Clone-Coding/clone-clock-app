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
        setData()
        
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
        view.backgroundColor = .black
        alarmTableView.backgroundColor = .black
        alarmTableView.separatorColor = .darkGray
        alarmTableView.tableFooterView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 0))
        alarmTableView.tableFooterView?.backgroundColor = .clear
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        plusButton.tintColor = .systemOrange
        
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.tintColor = .systemOrange
        editButtonItem.title = "편집"
        navigationItem.rightBarButtonItem = plusButton
        
        // navigation bar
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.setItems([navigationItem], animated: true)

        // large title
        // bug: 화면 첫 시작에서 안 보임..
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "알람"
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }
    
    func setData() {
        alarmData.append(contentsOf: [AlarmModel(meridiem: "오전", hour: 3, min: 23, status: true),AlarmModel(meridiem: "오전", hour: 3, min: 23, status: false)])
    }
}

extension AlarmVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return alarmData.count
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
            cell.setCell(alarm: alarmData[indexPath.row])
            
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = .boldSystemFont(ofSize: 15)
    }
}

extension AlarmVC: UITableViewDelegate {
}
