//
//  BudgetViewController.swift
//  PlatziFinanzas
//
//  Created by Marcos Avila Rodriguez on 07/03/22.
//

import UIKit

class BudgetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cellid")
    }
}

extension BudgetViewController: UITableViewDelegate {
    
}

extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
}
