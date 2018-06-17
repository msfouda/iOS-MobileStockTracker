//
//  NewItemViewController.swift
//  MobileStockTracker
//
//  Created by Mohamed Sobhi  Fouda on 6/17/18.
//  Copyright © 2018 Mohamed Sobhi Fouda. All rights reserved.
//

import UIKit
import CoreData

class NewItemViewController: UIViewController, NSFetchedResultsControllerDelegate, UITextFieldDelegate {

    var managedObjectContext: NSManagedObjectContext? = nil
    var ItemToEdit: Item? = nil
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let item = ItemToEdit {
            title = "Edit Item"
            textField.text = item.name
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        if let item = ItemToEdit {
            item.name = textField.text!
            item.timestamp = Date()
            self.save()
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext!) as! Item
            item.name = textField.text!
            item.timestamp = Date()
            self.save()
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    // Save the context.
    func save(){
        do {
            try managedObjectContext?.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }


}