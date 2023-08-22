//
//  ViewController.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 18.08.2023.
//

import UIKit

protocol AddRecordDelegate: AnyObject {
    func addNewRecord(newRecord: Record)
}

class ViewController: UIViewController {
    let table = UITableView()
    let toolbar = UIToolbar()
    let addButton = UIBarButtonItem()
    let model = Records()
    let cellID = "TableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Pressure diary"
        view.backgroundColor = .white
        model.loadRecords()
        setupView()
    }
    
    private func setupView() {
        addButton.target = self
        addButton.image = UIImage(systemName: "plus")
        addButton.action = #selector(showNewReocordScreen)
        navigationItem.rightBarButtonItem = addButton
        
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupToolbar() {
        toolbar.setItems([addButton], animated: false)
        
    }
    
    @objc func showNewReocordScreen() {
        let addScreen = AddViewController()
        addScreen.delegate = self
        present(addScreen, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.table:
            return model.activeRecords.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell

        let date = self.model.activeRecords[indexPath.row].date
        let dateString = date.prettyDate
        
        guard let sys = self.model.activeRecords[indexPath.row].sysPressure else {return cell}
        guard let dia = self.model.activeRecords[indexPath.row].diaPressure else {return cell}
        guard let pulse = self.model.activeRecords[indexPath.row].pulse else {return cell}
//        cell.textLabel?.text = "\(dateString): \(sys)/\(dia) - \(pulse)"
        cell.cellLabel.text = "\(dateString): \(sys)/\(dia) - \(pulse)"
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: AddRecordDelegate {
    func addNewRecord(newRecord: Record) {
        self.model.addRecord(newRecord: newRecord)
        self.table.reloadData()
    }
}
