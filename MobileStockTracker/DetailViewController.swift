//
//  DetailViewController.swift
//  MobileStockTracker
//
//  Created by Mohamed Sobhi  Fouda on 6/13/18.
//  Copyright © 2018 Mohamed Sobhi Fouda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.timestamp!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Item? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditItem" {
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! NewItemViewController
            controller.managedObjectContext = detailItem?.managedObjectContext
            controller.ItemToEdit = self.detailItem!
            
        }
    }


}

