//
//  MarcasTableViewController.swift
//  Caue
//
//  Created by Cauê Almeida on 8/27/17.
//  Copyright © 2017 Cauê Almeida. All rights reserved.
//

import UIKit

class MarcasTableViewController: UITableViewController {
    
    var dataSource: [Brand] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    func loadItems() {
        REST.loadItems { (items: [Brand]?) in
            if let items = items {
                self.dataSource = items
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = dataSource[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }

}
