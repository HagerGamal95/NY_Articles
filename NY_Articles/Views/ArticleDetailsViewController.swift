//
//  ArticleDetailsViewController.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionContainerView: UIStackView!
    var viewModel : ArticleDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel?.article?.section)
    }
    
}
