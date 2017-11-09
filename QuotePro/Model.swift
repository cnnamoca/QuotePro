//
//  Model.swift
//  QuotePro
//
//  Created by Carlo Namoca on 2017-11-08.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit
import Nuke

class Model: NSObject {

    var modelImage : UIImage? = nil
    var modelQuote : String? = nil
    var modelAuthor : String? = nil
    
    init?(image: UIImage, quote: String, author: String) {
        modelImage = image
        modelQuote = quote
        modelAuthor = author
    }
    
}
