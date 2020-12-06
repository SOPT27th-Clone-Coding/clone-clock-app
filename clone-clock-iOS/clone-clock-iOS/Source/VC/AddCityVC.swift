//
//  AddCityVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/29.
//

import UIKit

class AddCityVC: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var clockList : [ClockData] = []
    var fileteredList: [ClockData] = []
    var clockIndex : [String:[ClockData]] = [:]
    var clockSection: [String] = []
    var searchController = UISearchController()
    var resultVC = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setData()
        
        cityTableView.dataSource = self
        cityTableView.delegate = self
    }
}

extension AddCityVC {
    func setView() {
        searchBar.prompt = "도시 선택"
        // 왜 한 번 눌러야 적용이 되죠
        searchBar.tintColor = .systemOrange
        searchBar.barStyle = .black
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.placeholder = "검색"
        searchBar.showsCancelButton = true
        
        cityTableView.sectionIndexColor = .systemOrange
        cityTableView.separatorColor = .darkGray
        cityTableView.backgroundColor = .gray
        cityTableView.tableFooterView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 0))
        cityTableView.tableFooterView?.backgroundColor = .clear
    }
    
    func setData() {
        clockList.append(contentsOf: [ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ"), ClockData(time: "5:30", city: "갈라파고스 제도", diff: "오늘, -15시간", meridiem: "오전", section: "ㄱ"),ClockData(time: "7:33", city: "데이비스 기지", diff: "오늘, +0시간", meridiem: "오후", section: "ㄷ"),ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      ,ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후", section: "ㅅ")
                                      
        ])
        
        for clock in clockList {
            let index: String = clock.section!
            if var clockVal = clockIndex[index] {
                clockVal.append(clock)
                clockIndex[index] = clockVal
            } else {
                clockIndex[index] = [clock]
            }
        }
        
        clockSection = [String](clockIndex.keys)
        clockSection = clockSection.sorted(by: {$0 < $1}) //뭐야?
    }
}

// 나중에 searchBar랑 controller 연결하기
extension AddCityVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        fileteredList = clockList.filter({ (clockData: ClockData) -> Bool in
            return clockData.city.contains(searchController.searchBar.text!)
        })
        
        resultVC.tableView.reloadData()
    }
}

extension AddCityVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let value = clockSection[section]
        if let clockValue = clockIndex[value] {
            return clockValue.count
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return clockSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let section = clockSection[indexPath.section]
        
        if let value = clockIndex[section] {
            cell.textLabel?.text = value[indexPath.row].city
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.textLabel?.sizeToFit()
        }
        cell.backgroundColor = .gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return clockSection[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return clockSection
    }
}

extension AddCityVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let value = clockIndex[clockSection[indexPath.section]]?[indexPath.row] else {return}
        
        guard let pvc = self.presentingViewController as? UITabBarController else {return}
        pvc.selectedIndex = 0
        
        // 여기서 clockVC가 왜 안 나오나요...
//        guard let clockVC = pvc.selectedViewController as? UINavigationController else {return}
        
        self.dismiss(animated: true, completion: nil)
    }
}
