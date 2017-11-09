//
//  QuoteTableViewCell.swift
//  QuotePro
//
//  Created by Carlo Namoca on 2017-11-08.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var quote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
