//
//  CustomerViewController.swift
//  Services
//
//  Created by Kostiantyn Bilyk on 22.07.18.
//  Copyright © 2018 Kostiantyn Bilyk. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!

    // MARK: - Variables

    var customer: Customer?

    // MARK: - Constants

    enum Constants {
        enum validation {
            enum alert {
                static let title: String = "Validation Error!"
                static let message: String = "Input Name of the Customer, please."
            }
            enum action {
                static let title: String = "OK"
            }
        }
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let customer = customer {
            nameTextField.text = customer.name
            infoTextField.text = customer.info
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Custom Functions

    func saveCustomer() -> Bool {
        // Name Validation
        if let name = nameTextField.text, name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController(title: Constants.validation.alert.title,
                                          message: Constants.validation.alert.message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.validation.action.title,
                                          style: .cancel,
                                          handler: nil))
            present(alert, animated: true, completion: nil)

            return false
        }

        // Create Customer Object if needed
        if customer == nil {
            customer = Customer()
        }

        // Save Customer Object
        if let customer = customer {
            customer.name = nameTextField.text
            customer.info = infoTextField.text

            CoreDataManager.sharedInstance.saveContext()
        }

        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Actions

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        if saveCustomer() {
            dismiss(animated: true, completion: nil)
        }
    }
}
