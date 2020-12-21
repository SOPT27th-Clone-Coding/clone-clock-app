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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
}

extension AddSoundVC {
    func setView() {
        view.backgroundColor = .black
        
        //navigation bar
//        self.navigationBar.barStyle = .blackTranslucent
        self.navigationBar.topItem?.title = "타이머 종료 시"
    }
}
