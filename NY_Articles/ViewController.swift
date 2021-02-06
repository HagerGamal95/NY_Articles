//
//  ViewController.swift
//  NY_Articles
//
//  Created by hager gamal on 2/6/21.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let usersViewModel = ArticlesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        attemptFetchArticles()
    }
    fileprivate func attemptFetchArticles() {
        usersViewModel.FetchArticles(with: 7) { state in
            switch state {
            case .success: self.handleUIForSuccessFetchUsers()
            case .failure: self.showAlert()
            }
        }
    }
    fileprivate func handleUIForSuccessFetchUsers() {
//        self.tableView.reloadData()
    }
    
    fileprivate func showAlert() {
        guard let errorMessage = usersViewModel.message else {
            return
        }
//        showAlertController(withTitle: "Error", message: errorMessage, completion: nil)
    }
}

