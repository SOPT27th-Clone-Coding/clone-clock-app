//
//  TimerVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class TimerVC: UIViewController {
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var soundTableView: UITableView!
    
    var soundName: String = "전파 탐지기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        soundTableView.dataSource = self
        soundTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addSoundVC = segue.destination as? AddSoundVC {
            addSoundVC.delegate = self
        }
    }
}

extension TimerVC {
    func setView() {
        view.backgroundColor = .black
        timePicker.setValue(UIColor.systemGray, forKey: "textColor")
        timePicker.backgroundColor = .black
        soundTableView.backgroundColor = .black
        
        setCancelButton()
        setStartButton()
    }
    
    func setCancelButton() {
        leftButton.layer.cornerRadius = leftButton.frame.width * 0.5
        leftButton.backgroundColor = #colorLiteral(red: 0.3028068841, green: 0.3010125458, blue: 0.304189831, alpha: 0.3198576627)
        leftButton.setTitle("취소", for: .normal)
        leftButton.setTitleColor(.systemGray, for: .normal)
    }
    
    func setStartButton() {
        rightButton.layer.cornerRadius = leftButton.frame.width * 0.5
        rightButton.setTitle("시작", for: .normal)
        rightButton.setTitleColor(#colorLiteral(red: 0, green: 0.5576409101, blue: 0.02967337891, alpha: 1), for: .normal)
        rightButton.backgroundColor = #colorLiteral(red: 0, green: 0.3093507886, blue: 0.0365919508, alpha: 0.3198576627)
    }
}

extension TimerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimerSoundCell") as? TimerSoundCell else { return UITableViewCell() }
        cell.setCell(name: soundName)
        cell.selectionStyle = .none
        
        return cell
    }
}

extension TimerVC: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.y = 0
    }
}

extension TimerVC: TimerSoundDataDelegate {
    func sendSoundData(name: String) {
        soundName = name
        
        let indexPath = IndexPath(row: 0, section: 0)
        soundTableView.reloadRows(at: [indexPath], with: .fade)
    }
}
