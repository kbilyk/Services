//
//  CustomersTableViewController.swift
//  Services
//
//  Created by Kostiantyn Bilyk on 21.07.18.
//  Copyright © 2018 Kostiantyn Bilyk. All rights reserved.
//

import UIKit
import CoreData

class CustomersTableViewController: UITableViewController {

    // MARK: - Variables

    lazy var fetchedResultsController: NSFetchedResultsController<Customer> = {
        return CoreDataManager.sharedInstance.fetchedResultsController(entityName: NSStringFromClass(Customer.self),
                                                                       keyForSort: #keyPath(Customer.name))
        }() as! NSFetchedResultsController<Customer>

    // MARK: - Constants
    enum Constants {
        enum segues {
            static let customersToCustomer: String = "customersToCustomer"
        }
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {

            return sections.count
        } else {

            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {

            return sections[section].numberOfObjects
        } else {

            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let customer = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = customer.name

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customer = fetchedResultsController.object(at: indexPath) as Customer

        performSegue(withIdentifier: Constants.segues.customersToCustomer, sender: customer)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.segues.customersToCustomer {
            let controller = segue.destination as! CustomerViewController

            controller.customer = sender as? Customer
        }
    }

    // MARK: - Actions

    @IBAction func add(_ sender: UIBarButtonItem) {
         performSegue(withIdentifier: Constants.segues.customersToCustomer, sender: nil)
    }
}
