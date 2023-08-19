//
//  ViewController.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 18.08.2023.
//

import UIKit

class ViewController: UIViewController {
    let table = UITableView()
    let toolbar = UIToolbar()
    let model = Records()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Pressure diary"
        view.backgroundColor = .white
        model.loadRecords()
        setupView()
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func setupView() {
        print(model.activeRecords.count)
        toolbar.backgroundColor = .cyan
//        table.backgroundColor = .orange
        
        [table, toolbar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: toolbar.topAnchor),
            
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 50)
        ])
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let date = self.model.activeRecords[indexPath.row].date
        let dateString = date.prettyDate
        let sys = self.model.activeRecords[indexPath.row].sysPressure
        let dia = self.model.activeRecords[indexPath.row].diaPressure
        let pulse = self.model.activeRecords[indexPath.row].pulse
        cell.textLabel?.text = "\(dateString): \(sys)/\(dia) - \(pulse)"
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
