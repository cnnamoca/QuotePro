//
//  QuoteView.swift
//  QuotePro
//
//  Created by Carlo Namoca on 2017-11-08.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit
import Nuke

class QuoteView: UIView {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    private var contentView: UIView!
    
    //var img = Data()
    
    func importImage() {
        let url = URL(string: "https://lorempixel.com/300/300/abstract/")
        let task = URLSession.shared.dataTask(with: url!) { data, resp, err in
            
            if let data = data {
                DispatchQueue.main.async() {
                    let tempImage = UIImage(data:data)
                    self.imageView.image = tempImage
                }
            }
        
        }
        task.resume()
    }
    
    func importQuote() {     
        let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let task = URLSession.shared.dataTask(with: url!) { data, resp, err in
            
            if let data = data {
                DispatchQueue.main.async() {
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any] else {
                        print("data returned is not json, or not valid")
                        return
                    }
                    let quote: String = json["quoteText"] as! String
                    self.quoteLabel.text = quote
                    let author: String = json["quoteAuthor"] as! String
                    self.authorLabel.text = author
                }
            }
            
        }
        task.resume()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Called when view is created from XIB
        super.init(coder: aDecoder)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "QuoteView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            assertionFailure("Unable to load XIB file for QuoteView")
            return
        }
        
        contentView = view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }

    
}
