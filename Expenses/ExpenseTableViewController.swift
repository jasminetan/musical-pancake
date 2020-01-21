//
//  ExpenseTableViewController.swift
//  Expenses
//
//  Created by Jasmine Tan on 1/21/20.
//  Copyright © 2020 Jasmine Tan. All rights reserved.
//

import UIKit
import Foundation

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   @IBOutlet weak var tableView: UITableView!
    

    var expenses = [Expense]()
    var dateFormatter = DateFormatter()
    var displayDateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayDateFormatter.dateStyle = .medium
        displayDateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "MMMM d, yyyy HH:mm"
        if let date = dateFormatter.date(from: "June 1, 2018 18:30"){
            expenses.append(Expense(date: date, title: "Dinner", amount: 32.50))
        }
        if let date = dateFormatter.date(from: "May 30, 2018 12:17"){
            expenses.append(Expense(date: date, title: "Office Supplies", amount: 59.34))
        }
        if let date = dateFormatter.date(from: "May 30, 2018 11:43"){
            expenses.append(Expense(date: date, title: "Uber", amount: 16.23))
        }
        if let date = dateFormatter.date(from: "May 29, 2018 8:45"){
            expenses.append(Expense(date: date, title: "Coffee", amount: 3.95))
        }
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        if let cell = cell as? ExpenseTableViewCell{
            let expense = expenses[indexPath.row]
            cell.titleLabel.text=expense.title
            cell.costLabel.text=String(expense.amount)
            cell.dateLabel.text = displayDateFormatter.string(from: expense.date)
        }
        
        return cell
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
