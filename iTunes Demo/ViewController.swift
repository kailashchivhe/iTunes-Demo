//
//  ViewController.swift
//  iTunes Demo
//
//  Created by Kailash Chivhe on 17/03/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    var categories = Array(AppsData.data.keys)
    var selectedCategory = ""
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Array(AppsData.data.keys).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Categories", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVCName = segue.destination as! AppsViewController
        destinationVCName.apps = AppsData.data[selectedCategory]
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "AppsSegue", sender: self)
    }
}
