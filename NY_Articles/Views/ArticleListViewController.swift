//
//  ArticleListViewController.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import UIKit
import Kingfisher

enum ViewState {
    case loading
    case content
    case error(message: String)
}

class ArticleListViewController: UIViewController {
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    private var state: ViewState = .loading {
        didSet {
            updateViews()
        }
    }
    fileprivate let articlesViewModel = ArticlesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        attemptFetchUsers()
    }
    
    fileprivate func attemptFetchUsers() {
        state = .loading
        articlesViewModel.FetchArticles(with: 7) { state in
            switch state {
            case .success: self.handleUIForSuccessFetchUsers()
            case .failure: self.showAlert()
            }
        }
    }
    
    fileprivate func handleUIForSuccessFetchUsers() {
        state = .content
        self.tableView.reloadData()
    }
    
    fileprivate func showAlert() {
        guard let errorMessage = articlesViewModel.message else {
            return
        }
        state = .error(message: errorMessage)
    }
    
    private func updateViews() {
        switch state {
        case .loading:
            self.activityIndicator.startAnimating()
            self.errorView.isHidden = true
            self.tableView.isHidden = true
        case .content:
            self.activityIndicator.stopAnimating()
            self.errorView.isHidden = true
            self.tableView.isHidden = false
        case .error(let message):
            errorLabel.text = message
            self.activityIndicator.stopAnimating()
            self.errorView.isHidden = false
            self.tableView.isHidden = true
        }
    }
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        setupCell()
    }
    
    fileprivate func setupCell() {
        tableView.register(UINib(nibName: "HeadlineTableViewCell", bundle: nil), forCellReuseIdentifier: "HeadlineTableViewCell")
    }
    
    fileprivate func setupNavBar() {
        title = "Articles"
    }
    
}

// MARK: - UITableViewDataSource

extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesViewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineTableViewCell", for: indexPath) as! HeadlineTableViewCell
        let article = articlesViewModel.articles[indexPath.row]
        
        if let imageSource = article.media?.first?.mediaMetadata?[2].url {
            cell.myImage.kf.setImage(with: URL(string: imageSource), placeholder: UIImage(named: "Logo"))
        }
        
        cell.titleLabel.text = article.title
        cell.shortDescription.text = article.abstract
        cell.sourceLabel.text = article.byline
        cell.publishedDateLabel.text = DateFormatter().getPublishedDateWithServiceFormat(date:  article.publishedDate ?? Date())
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articlesViewModel.articles[indexPath.row]
        showUser(with: article)
    }
    
    func showUser(with article: Article) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController else {
            return
        }
        let detailsViewModel = ArticleDetailsViewModel(article: article)
        viewController.viewModel = detailsViewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
