//
//  BaseController.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class BaseController: UIViewController {
    
    var refreshControl = UIRefreshControl()
    var isNetworkScreenPresented: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.tintColor = .black
        isNetworkScreenPresented = false
        setupNavigation()
    }
}

// MARK: Navigation Item
extension BaseController {

    func setupNavigation() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
    }
}

// MARK: TableView Refresher
extension BaseController {
    
    func addRefresher(_ tableView: UITableView, _ color: UIColor? = .black) {
        DispatchQueue.main.async {
            tableView.refreshControl = self.refreshControl
            self.refreshControl.tintColor = color
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.refreshControl.beginRefreshing()
        }
    }

    func endRefresher() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}

extension BaseController {
    
    func showNetworkErrorScreen(_ delegate: NetworkScreenControllerDelegate?, _ view: UIView) {
        isNetworkScreenPresented = true
        NETWORK.delegate = delegate
        NETWORK.showAsSubView(view)
    }
    
    func closeNetworkErrorScreen() {
        isNetworkScreenPresented = false
        if NETWORK.isPresented {
            NETWORK.close()
        }
    }
    
    func checkNetworkError(_ apiFunction: () -> Void) {
        if isNetworkScreenPresented ?? false && !NETWORK.isPresented {
            apiFunction()
        }
    }
}
