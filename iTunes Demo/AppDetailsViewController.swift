//
//  AppDetailsViewController.swift
//  iTunes Demo
//
//  Created by Kailash Chivhe on 17/03/23.
//

import UIKit

class AppDetailsViewController: UIViewController {
    
    @IBAction func onCloseClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var developerName: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
  
    @IBOutlet weak var price: UILabel!
    
    var appDetails: App?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTitle.text = appDetails?.title
        developerName.text = appDetails?.developer
        releaseDate.text = appDetails?.releaseDate
        price.text = appDetails?.price
    }

}
