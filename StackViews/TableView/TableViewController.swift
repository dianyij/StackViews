//
//  TableViewController.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(StackViewCell0.self, forCellReuseIdentifier: StackViewCell0.reuseIdentifier)
        tableView.register(StackViewCell1.self, forCellReuseIdentifier: StackViewCell1.reuseIdentifier)
        tableView.register(StackViewCell2.self, forCellReuseIdentifier: StackViewCell2.reuseIdentifier)
        tableView.register(StackViewCell3.self, forCellReuseIdentifier: StackViewCell3.reuseIdentifier)
        tableView.register(StackViewCell4.self, forCellReuseIdentifier: StackViewCell4.reuseIdentifier)
        let bbi1 = UIBarButtonItem(title: "Scroll", style: .plain, target: self, action: #selector(onScrollClick))
        let bbi2 = UIBarButtonItem(title: "Collection", style: .plain, target: self, action: #selector(onCollectionClick))

        navigationItem.rightBarButtonItems = [bbi1, bbi2]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: StackViewCell0.reuseIdentifier, for: indexPath)
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: StackViewCell1.reuseIdentifier, for: indexPath)
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: StackViewCell2.reuseIdentifier, for: indexPath)
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: StackViewCell3.reuseIdentifier, for: indexPath) as! StackViewCell3
            cell.commonInit()
            cell.tableView = tableView
            return cell
        case 4:
            return tableView.dequeueReusableCell(withIdentifier: StackViewCell4.reuseIdentifier, for: indexPath)
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: StackViewCell0.reuseIdentifier, for: indexPath) as! StackViewCell0
//            print(cell)
            return cell
        }
    }
}

extension TableViewController {
    @objc func onScrollClick() {
        navigationController?.pushViewController(ScrollViewController(), animated: true)
    }

    @objc func onCollectionClick() {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }
}
