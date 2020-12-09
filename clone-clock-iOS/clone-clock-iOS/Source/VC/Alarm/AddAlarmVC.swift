//
//  AddAlarmVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/10.
//

import UIKit

class AddAlarmVC: UIViewController {
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func touchUpCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddAlarmVC {
    func setView() {
        // navigation bar
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.topItem?.title = "알람 추가"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .systemOrange
    }
}
