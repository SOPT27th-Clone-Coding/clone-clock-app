//
//  StopWatchVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class StopWatchVC: UIViewController {
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var timerTableView: UITableView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var leftButtonIsActive: Bool = false
    var rightButtonIsActive: Bool = false
    
    let interval = 0.01
    var count = 0
    var timer: Timer?
    
    var timerData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        timerTableView.dataSource = self
    }
    
    @IBAction func touchUpLeftButton(_ sender: Any) {
        if leftButtonIsActive {
            // 시간 기록 (랩)
            addTimerData()
        } else{
            count = 0
            timerLabel.text = timerTimeFormat(time: 0)
            
            setLabButton()
            timerData.removeAll()
            timerTableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
        }
    }
    
    @IBAction func touchUpRIghtButton(_ sender: Any) {
        if rightButtonIsActive {
            if timer!.isValid {
                // 중단
                timer?.invalidate()
                
                setStartButton()
                setResetButton()
            }
        } else {
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

            setStopButton()
            setActiveLabButton()
        }
    }
}

extension StopWatchVC {
    func setDefaultButton() {
        rightButton.layer.cornerRadius = rightButton.bounds.size.width * 0.5
        leftButton.layer.cornerRadius = leftButton.bounds.size.width * 0.5

        leftButton.setTitle("랩", for: .normal)
        leftButton.setTitleColor(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1), for: .normal)

        setStartButton()
        setLabButton()
    }
    
    func setResetButton() {
        leftButtonIsActive = false
        
        leftButton.setTitle("재설정", for: .normal)
        leftButton.setTitleColor(.white, for: .normal)
    }
    
    func setStopButton(){
        rightButtonIsActive = true

        rightButton.setTitle("중단", for: .normal)
        rightButton.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
        rightButton.backgroundColor = #colorLiteral(red: 1, green: 0.3253991604, blue: 0.1530405879, alpha: 0.2535049229)
    }
    
    func setLabButton() {
        rightButtonIsActive = false
        
        leftButton.setTitle("랩", for: .normal)
        leftButton.setTitleColor(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1), for: .normal)
        leftButton.backgroundColor = #colorLiteral(red: 0.3028068841, green: 0.3010125458, blue: 0.304189831, alpha: 0.3198576627)
    }
    
    func setActiveLabButton() {
        leftButtonIsActive = true
        
        leftButton.setTitle("랩", for: .normal)
        leftButton.setTitleColor(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1), for: .normal)
        leftButton.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 0.7007973031)
    }
    
    func setStartButton() {
        rightButtonIsActive = false
        
        rightButton.setTitle("시작", for: .normal)
        rightButton.setTitleColor(#colorLiteral(red: 0, green: 0.5576409101, blue: 0.02967337891, alpha: 1), for: .normal)
        rightButton.backgroundColor = #colorLiteral(red: 0, green: 0.3093507886, blue: 0.0365919508, alpha: 0.3198576627)
    }
    
    func setView() {
        setDefaultButton()
        
        timerTableView.backgroundColor = .black
        timerLabel.text = timerTimeFormat(time: 0)
        timerLabel.numberOfLines = 1
        timerLabel.adjustsFontSizeToFitWidth = true
        timerLabel.minimumScaleFactor = 0.5
        timerLabel.sizeToFit()
    }
    
    @objc func updateTimer() {
        count += 1
        timerLabel.text = timerTimeFormat(time: count)
    }
    
    func timerTimeFormat(time: Int) -> String{
        let min = time / 3600
        let sec = (time % 3600) / 60
        let centiSec = (time % 3600) % 100
        
        let minStr = min < 10 ? "0\(min)" : String(min)
        let secStr = sec < 10 ? "0\(sec)" : String(sec)
        let centiStr = centiSec < 10 ? "0\(centiSec)" : String(centiSec)
        
        return "\(minStr):\(secStr).\(centiStr)"
    }
    
    func addTimerData() {
        timerData.insert(timerTimeFormat(time: count), at: 0)
        timerTableView.reloadData()
    }
}


extension StopWatchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = timerTableView.dequeueReusableCell(withIdentifier: "LabCell") as? LabCell else {return UITableViewCell()}
        
        cell.setCell(index: timerData.count - indexPath.row, timer: timerData[indexPath.row])

        return cell
    }
}
