//
//  NewSpentViewController.swift
//  SpentsTDD
//
//  Created by Matheus Garcia on 28/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit
import CoreData

enum FieldsNotFilled {
    case name
    case value
}

class NewSpentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!

    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("Unable to find appDelegate") }
        return appDelegate.persistentContainer.viewContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func alertUser(missing: FieldsNotFilled) {

    }

    func checkFields() {

        var name: String
        var description: String?
        var value: Double

        if let nameText = nameTextField.text {
            name = nameText
        } else {
            alertUser(missing: FieldsNotFilled.name)
            return
        }

        if let valueText = valueTextField.text {
            guard let doubleValue = Double(valueText) else { return }
            value = doubleValue
        } else {
            alertUser(missing: FieldsNotFilled.value)
            return
        }

        if let descriptionText = valueTextField.text {
            description = descriptionText
        } else {
            description = nil
        }

        saveContext(name, description, value)
    }

    func saveContext(_ name: String, _ description: String?, _ value: Double) {
        let spent = Spent(context: context)
        spent.name = name
        spent.spentDescription = description
        spent.value = value

        do {
            try context.save()
            _ = navigationController?.popViewController(animated: true)
        } catch {
            print("Ops, something went wrong while trying to save context:\n\(error.localizedDescription)")
        }
    }

    @IBAction func doneWasPressed(_ sender: UIBarButtonItem) {

        checkFields()
    }
}
