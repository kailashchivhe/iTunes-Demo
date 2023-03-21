//
//  AppsViewController.swift
//  iTunes Demo
//
//  Created by Kailash Chivhe on 17/03/23.
//

import UIKit

class AppsViewController: UIViewController, UITableViewDataSource {
    
    var apps: [App]?
    var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Apps", for: indexPath)
        let appTitle = cell.viewWithTag(1) as! UILabel
        let developerName = cell.viewWithTag(2) as! UILabel
        let releaseDate = cell.viewWithTag(3) as! UILabel
        let price = cell.viewWithTag(4) as! UILabel
        
        appTitle.text = apps?[indexPath.row].title
        developerName.text = apps?[indexPath.row].developer
        releaseDate.text = apps?[indexPath.row].releaseDate
        price.text = apps?[indexPath.row].price
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVCName = segue.destination as! AppDetailsViewController
        destinationVCName.appDetails = apps?[selectedIndex ?? 0]
    }
}

extension AppsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "AppDetails", sender: self)
    }
}
