//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Carlo Namoca on 2017-11-08.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

protocol QuoteDelegate {
    func loadQuotes(quote: Model)
}

class QuoteBuilderViewController: UIViewController {
    @IBOutlet weak var myView: QuoteView!
    
    var quote : Model?
    var delegate : QuoteDelegate?
    
    var quoteArr = [Model]()
    
    var sourceVC = QuoteTableViewController()
    var sourceIndexPath = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let quote = quote {
            myView.imageView.image = quote.modelImage
            myView.authorLabel.text = quote.modelAuthor
            myView.quoteLabel.text = quote.modelQuote
        }
    }

    @IBAction func generateImg(_ sender: UIButton) {
        myView.importImage()
    }
    
    @IBAction func generateQuote(_ sender: UIButton) {
        myView.importQuote()
    }
    
    @IBAction func save(_ sender: UIButton) {
        if self.isEditing == true{
            quote = Model(image: myView.imageView.image!, quote: myView.quoteLabel.text!, author: myView.authorLabel.text!)
            sourceVC.quotes[sourceIndexPath.row] = self.quote!
            dismiss(animated: true, completion: nil)
        } else {
            quote = Model(image: myView.imageView.image!, quote: myView.quoteLabel.text!, author: myView.authorLabel.text!)
            sourceVC.quote = self.quote
            self.delegate = sourceVC
            sourceVC.loadQuotes(quote: quote!)
            dismiss(animated: true, completion: nil)
        }
    }
}
