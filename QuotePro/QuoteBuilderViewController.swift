//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Carlo Namoca on 2017-11-08.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

//    var quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: nil)?.first as! QuoteView

//    @IBOutlet weak var myView: QuoteView!
    
    @IBOutlet weak var myView: QuoteView!
    
    var quoteArr : Array<Model> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func generateImg(_ sender: UIButton) {
        myView.importImage()
    }
    
    @IBAction func generateQuote(_ sender: UIButton) {
        myView.importQuote()
    }
    
    @IBAction func save(_ sender: UIButton) {
        let model = Model(image: myView.imageView.image!, quote: myView.quoteLabel.text!, author: myView.authorLabel.text!)
        quoteArr.append(model)
    }
    


}
