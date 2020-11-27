//
//  ClockVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class ClockVC: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var clockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        clockTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ClockVC {
    func setView() {
        clockTableView.backgroundColor = .black
        
        // navigation bar
        let editButton = UIBarButtonItem(title: "편집", style: .plain, target: self, action: nil)
        editButton.tintColor = .systemOrange
        editButton.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 16)], for: .normal)
         
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        plusButton.tintColor = .systemOrange
        
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = plusButton
        
        navigationBar.setItems([navigationItem], animated: true)
        navigationBar?.topItem?.title = .none
        navigationBar.barTintColor = .black
        navigationBar.isTranslucent = false
        
//         table view
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        header.backgroundColor = .black

        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "세계 시계"
        headerLabel.font = .boldSystemFont(ofSize: 30)
        headerLabel.textAlignment = .left
        headerLabel.textColor = .white

        header.addSubview(headerLabel)

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 18).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        clockTableView.tableHeaderView = header
        
        clockTableView.separatorColor = .systemGray
    }
}

extension ClockVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
