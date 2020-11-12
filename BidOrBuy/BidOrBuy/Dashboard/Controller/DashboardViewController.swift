//
//  DashboardViewController.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import UIKit
import MBProgressHUD

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lastUpdatedTime: UILabel!
    
    private lazy var viewModel = DashboardViewModel(view: self)
    private var displayItemsArray = [Trade]()
    private let toast = Toast()
    
    private lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.searchBarStyle = UISearchBar.Style.minimal
        controller.searchBar.sizeToFit()
        controller.searchBar.showsScopeBar = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Search keywords"
        return controller
    })()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "bidorbuy"
        self.setupSearchController()
        self.tableView.reloadData()
    }
    
    func setupSearchController() {
        self.searchController.searchBar.delegate = self
        self.searchController.searchResultsUpdater = self
        definesPresentationContext = true
        self.navigationItem.searchController = searchController
    }
    
}

//MARK:- Tableview delegate and datasource
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.displayItemsArray.count > 0 {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
            return 1
        }

        let rect = CGRect(x: 0,
                          y: 0,
                          width: self.tableView.bounds.size.width,
                          height: self.tableView.bounds.size.height)
        let noDataLabel: UILabel = UILabel(frame: rect)

        noDataLabel.text = "No items."
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = NSTextAlignment.center
        self.tableView.backgroundView = noDataLabel
        self.tableView.separatorStyle = .none
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell else {
            return UITableViewCell()
        }
        let trade = self.displayItemsArray[indexPath.row]
        cell.updateUI(trade: trade)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let trade = self.displayItemsArray[indexPath.row]
        self.navigateToTradeDetails(data: trade)
    }
}

//MARK:- DashboardView delegate
extension DashboardViewController: DashboardView {
    func updateTradeSearchData(result: TradeSearch) {
        self.displayItemsArray = result.trade ?? []
        self.reloadTableView()
    }
    
    func navigateToTradeDetails(data: Trade) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let objTradeDetailsVC = storyBoard.instantiateViewController(withIdentifier: "TradeDetailsViewController") as? TradeDetailsViewController else {
            return
        }
        objTradeDetailsVC.objTradeItem = data
        self.navigationController?.pushViewController(objTradeDetailsVC, animated: true)
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func dismissLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func updateForcaseData(list: [Trade]) {
        self.displayItemsArray = list
    }
    
    func showToast(message: String) {
        toast.showToast(message: message)
    }
}

//MARK:- UISearchBar delegate
extension DashboardViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

extension DashboardViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.searchController.searchBar.resignFirstResponder()
            self.displayItemsArray.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchController.searchBar.text {
            self.viewModel.checkInternetConnectivity(searchText)
        }
    }
}
