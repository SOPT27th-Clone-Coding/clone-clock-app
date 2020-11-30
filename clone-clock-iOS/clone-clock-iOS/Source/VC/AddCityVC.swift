//
//  AddCityVC.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/29.
//

import UIKit

class AddCityVC: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    
    var clockList : [ClockData] = []
    var fileteredList: [ClockData] = []
    var searchController = UISearchController()
    var resultVC = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        clockList.append(contentsOf: [ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후"), ClockData(time: "5:30", city: "갈라파고스 제도", diff: "오늘, -15시간", meridiem: "오전"),ClockData(time: "7:33", city: "데이비스 기지", diff: "오늘, +0시간", meridiem: "오후"),ClockData(time: "7:33", city: "서울", diff: "오늘, +0시간", meridiem: "오후")])
        
        cityTableView.dataSource = self
    }
}

extension AddCityVC {
    func setView() {
        searchController = UISearchController(searchResultsController: resultVC)
        searchController.searchBar.prompt = "도시 선택"
        searchController.searchBar.tintColor = .systemOrange
        searchController.searchBar.barStyle = .black
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchBar.showsCancelButton = true
        searchController.searchBar.searchBarStyle = .minimal
        
        cityTableView.tableHeaderView = searchController.searchBar
        cityTableView.backgroundColor = .black
        cityTableView.tintColor = .black
        
        self.definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
    }
}

extension AddCityVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        fileteredList = clockList.filter({ (clockData: ClockData) -> Bool in
            return clockData.city.contains(searchController.searchBar.text!)
        })
        
        resultVC.tableView.reloadData()
    }
}

extension AddCityVC: UISearchBarDelegate {
    
}

extension AddCityVC: UISearchControllerDelegate {
    
}

extension AddCityVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == resultVC.tableView ? fileteredList.count : clockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = (tableView == resultVC.tableView ? fileteredList[indexPath.row].city : clockList[indexPath.row].city)
        cell.textLabel?.sizeToFit()
        
        return cell
    }
}
