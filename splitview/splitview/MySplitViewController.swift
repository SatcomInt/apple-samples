//
//  MySplitViewController.swift
//  splitview
//
//  Created by Jose on 05/11/2019.
//  Copyright © 2019 SatcomInt. All rights reserved.
//

import UIKit

class MySplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
        let detailView = { ()->DetailViewController? in
            var detail: DetailViewController?
            self.viewControllers.forEach({
                if let navigation = $0 as? UINavigationController {
                    if let details = navigation.viewControllers.first as? DetailViewController {
                        detail = details
                    }
                }
            })
            return detail
        }()
        switch displayMode {
        case .primaryOverlay:
            print("overlay")
            detailView?.leading?.constant = svc.primaryColumnWidth
        case .primaryHidden:
            print("primary hidden")
            detailView?.leading?.constant = 0
        default: break
        }
    }

}
