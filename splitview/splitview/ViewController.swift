//
//  ViewController.swift
//  splitview
//
//  Created by Jose on 05/11/2019.
//  Copyright © 2019 SatcomInt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem =
            splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }


}

