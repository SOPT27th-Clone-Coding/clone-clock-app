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
    
    var soundData: [String] = ["전파 탐지기", "공상음", "공지음", "녹차"
                               , "놀이 시간", "느린 상승", "도입음","물결", "반짝반짝", "반향", "발산", "밤부엉이", "별자리", "상승음","순환음", "신호","신호음", "실크", "우주", "일루미네이트", "절정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        soundTableView.dataSource = self
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
        
        //table view
        soundTableView.backgroundColor = .black
    }
}

extension AddSoundVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = soundTableView.dequeueReusableCell(withIdentifier: "TimerSoundOptionCell") as? TimerSoundOptionCell else {return UITableViewCell()}
        
        cell.setCell(name: soundData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}


