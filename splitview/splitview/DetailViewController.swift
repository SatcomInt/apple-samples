//
//  DetailViewController.swift
//  splitview
//
//  Created by Jose on 05/11/2019.
//  Copyright © 2019 SatcomInt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var leading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem =
            splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }

    func updateLeading(_ constraint: CGFloat) {
        self.leading?.constant = constraint
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
