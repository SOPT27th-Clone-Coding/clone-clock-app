//
//  ClockVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class ClockVC: UIViewController {
    @IBOutlet weak var clockTableView: UITableView!
    
    var clockList : [ClockData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        clockList.append(contentsOf: [ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후"), ClockData(time: "5:30", city: "갈라파고스 제도", diff: "오늘, -15시간", meridiem: "오전"),ClockData(time: "7:33", city: "데이비스 기지", diff: "오늘, +0시간", meridiem: "오후"),ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후")])
        
        clockTableView.dataSource = self
        clockTableView.delegate = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if(editing && !clockTableView.isEditing){
            clockTableView.setEditing(true, animated: true)
            editButtonItem.title = "완료"
         }else{
            clockTableView.setEditing(false, animated: true)
            editButtonItem.title = "편집"
         }
    }
}

extension ClockVC {
    func setView() {
        clockTableView.backgroundColor = .black
        view.backgroundColor = .black
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        plusButton.tintColor = .systemOrange
        
        // 내장 editButton이 있었다
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.tintColor = .systemOrange
        editButtonItem.title = "편집"
        navigationItem.rightBarButtonItem = plusButton
        
        // navigation bar
        self.navigationController?.navigationBar.setItems([navigationItem], animated: true)
        self.navigationController?.navigationBar.topItem?.title = .none
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        // largeTitle (세계 시계)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "세계 시계"
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        //         table view
        //        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        //        header.backgroundColor = .black
        //
        //        let headerLabel = UILabel(frame: header.bounds)
        //        headerLabel.text = "세계 시계"
        //        headerLabel.font = .boldSystemFont(ofSize: 30)
        //        headerLabel.textAlignment = .left
        //        headerLabel.textColor = .white
        //
        //        header.addSubview(headerLabel)
        //
        //        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        //        headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 18).isActive = true
        //        headerLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        //        clockTableView.tableHeaderView = header
        
        // 구분선 색 변경
        clockTableView.separatorColor = .darkGray
        
        // footer view (데이터 없을 때 아래 셀이 안 나오는 것처럼)
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 0))
        footer.backgroundColor = .clear
        clockTableView.tableFooterView = footer
    }
}

extension ClockVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell") as? ClockCell else {return UITableViewCell()}
        
        cell.setCell(clock: clockList[indexPath.row])
        cell.overrideUserInterfaceStyle = .dark
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ClockVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clockTableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 테이블 셀 슬라이드 삭제
    // cell의 개수가 clockList.count이기 때문에 clockList 요소도 함께 삭제해줘야함
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            clockList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left) // .left랑 .fade 차이가 뭐죠
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
        
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
}
