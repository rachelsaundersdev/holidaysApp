//
//  HolidaysTableViewController.swift
//  holidayAPITable
//
//  Created by Rachel Saunders on 01/12/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import UIKit

class HolidaysTableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    
    
}

extension HolidayTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
    }
}
