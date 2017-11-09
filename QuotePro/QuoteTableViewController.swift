//
//  QuoteTableViewController.swift
//  QuotePro
//
//  Created by Carlo Namoca on 2017-11-08.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

import UIKit

class QuoteTableViewController: UITableViewController, QuoteDelegate {
    
    var quotes = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteTableViewCell
        
        let quote = quotes[indexPath.row]
        cell.quoteAuthor.text = quote.modelAuthor
        cell.quote.text = quote.modelQuote


        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowQuote"{
        guard let quoteVC = segue.destination as? QuoteBuilderViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedQuoteCell = sender as? QuoteTableViewCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedQuoteCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedQuote = quotes[indexPath.row]
        quoteVC.quote = selectedQuote
        quoteVC.isEditing = true
            
        }
    }
    
    //MARK: Delegate Methods
    func loadQuotes(){
        
    }
    

}
