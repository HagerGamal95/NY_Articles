//
//  HeadlineTableViewCell.swift
//  NY_Articles
//
//  Created by hager gamal on 2/7/21.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

   
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = cardView.cornerRadius
    }
    
}
