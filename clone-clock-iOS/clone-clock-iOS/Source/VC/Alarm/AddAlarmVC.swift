//
//  AddAlarmVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/10.
//

import UIKit

protocol sendAlarmDelegate {
    func sendAlarmData(alarm: AlarmModel)
}

class AddAlarmVC: UIViewController {
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var addAlarmTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    var cellTitle : [String] = []
    var cellInfo: [String] = []
    var repeatLabel: String?
    
    var alarmDelegate: sendAlarmDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setView()
        
        addAlarmTableView.dataSource = self
    }
    
    @IBAction func touchUpCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // refact!! : 구조 변경하면서 위임을 AlarmVC에서 해야할 것 같음
    @IBAction func touchUpSave(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        let date = dateFormatter.string(from: timePicker.date)
        print(date)
        guard let vc = self.storyboard?.instantiateViewController(identifier: "AlarmVC") as? AlarmVC else {return}
        alarmDelegate = vc
        
        alarmDelegate?.sendAlarmData(alarm: AlarmModel(meridiem: "dhdnd", hour: 3, min: 23, status: true))
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let repeatVC = segue.destination as? RepeatVC {
            repeatVC.delegate = self
        }
        
    }
}

extension AddAlarmVC {
    func setData() {
        cellTitle.append(contentsOf: ["반복", "레이블", "사운드", "다시 알림"])
        cellInfo.append(contentsOf: ["안 함", "알람", "없음", "true"])
    }
    
    func setView() {
        // header view
        addAlarmTableView.tableHeaderView = headerView
        
        // navigation bar
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.topItem?.title = "알람 추가"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .systemOrange
        
        //table view
        addAlarmTableView.backgroundColor = .darkGray
        addAlarmTableView.separatorColor = .gray
        
        let footer = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        addAlarmTableView.tableFooterView = footer
    }
}

extension AddAlarmVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = addAlarmTableView.dequeueReusableCell(withIdentifier: "RepeatCell") as? RepeatCell else { return UITableViewCell()}
            cell.setCell(info: repeatLabel ?? "안 함")
            
            return cell
        case 1:
            guard let cell = addAlarmTableView.dequeueReusableCell(withIdentifier: "LabelCell") as? LabelCell else {return UITableViewCell()}
            
            return cell
        case 2:
            guard let cell = addAlarmTableView.dequeueReusableCell(withIdentifier: "SoundCell") as? SoundCell else {return UITableViewCell()}
            
            return cell
        case 3:
            guard let cell = addAlarmTableView.dequeueReusableCell(withIdentifier: "RemindCell") as? RemindCell else { return UITableViewCell() }

            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension AddAlarmVC: sendRepeatData {
    func sendRepeatData(repeatData: String) {
        repeatLabel = repeatData
        addAlarmTableView.reloadData()
    }
}
