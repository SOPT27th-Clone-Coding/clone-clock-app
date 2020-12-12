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
    
    var leftButtonIsActive: Bool = false
    var rightButtonIsActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func touchUpLeftButton(_ sender: Any) {
    }
    
    @IBAction func touchUpRIghtButton(_ sender: Any) {
    }
}

extension StopWatchVC {
    func setButton() {
        leftButton.setTitle("랩", for: .normal)
        leftButton.setTitleColor(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1), for: .normal)
        leftButton.layer.cornerRadius = leftButton.bounds.size.width * 0.5
        leftButton.backgroundColor = #colorLiteral(red: 0.3028068841, green: 0.3010125458, blue: 0.304189831, alpha: 0.3198576627)
        
        rightButton.setTitle("시작", for: .normal)
        rightButton.setTitleColor(#colorLiteral(red: 0, green: 0.5576409101, blue: 0.02967337891, alpha: 1), for: .normal)
        rightButton.layer.cornerRadius = rightButton.bounds.size.width * 0.5
        rightButton.backgroundColor = #colorLiteral(red: 0, green: 0.3093507886, blue: 0.0365919508, alpha: 0.3198576627)
    }
    
    func setView() {
        setButton()
        
        timerTableView.backgroundColor = .black
    }
}
