//
//  AddSoundVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/19.
//

import UIKit

class AddSoundVC: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var soundTableView: UITableView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var settingButton: UIBarButtonItem!
    
    var soundData: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
    
    @IBAction func touchUpCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddSoundVC {
    func setView() {
        view.backgroundColor = .black
        
        //navigation bar
        self.navigationBar.barStyle = .black
        self.navigationBar.topItem?.title = "타이머 종료 시"
        
        cancelButton.tintColor = .systemOrange
        cancelButton.title = "취소"
        settingButton.tintColor = .systemOrange
        settingButton.title = "설정"
    }
}
 
