//
//  ClockVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class ClockVC: UIViewController {
    @IBOutlet weak var clockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        

        
        clockTableView.dataSource = self
        clockTableView.delegate = self
    }
}

extension ClockVC {
    func setView() {
        clockTableView.backgroundColor = .black
        view.backgroundColor = .black
        
        // navigation item
        let editButton = UIBarButtonItem(title: "편집", style: .plain, target: self, action: nil)
        editButton.tintColor = .systemOrange
        editButton.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 16)], for: .normal)
        
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        plusButton.tintColor = .systemOrange
        
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = plusButton
        
        // navigation bar
        self.navigationController?.navigationBar.setItems([navigationItem], animated: true)
        self.navigationController?.navigationBar.topItem?.title = .none
        self.navigationController?.navigationBar.barTintColor = .black
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell") as? ClockCell else {return UITableViewCell()}
        
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
}
