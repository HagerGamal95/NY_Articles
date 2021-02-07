//
//  ArticleDetailsViewController.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptioLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var viewModel : ArticleDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Details"
        setupUI()
    }
    func setupUI(){
        guard let article = viewModel?.article else{return}
        if let url = URL(string: article.media?.first?.mediaMetadata?[2].url ?? ""){
            imageView.kf.setImage(with: url , placeholder: UIImage(named: "splash"))
        }
        typeLabel.text = article.source
        nameLabel.text = article.title
        shortDescriptioLabel.text = article.byline
        descriptionLabel.text = article.abstract
    }
}
