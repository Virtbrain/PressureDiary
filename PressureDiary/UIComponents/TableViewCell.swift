//
//  TableViewCell.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 18.08.2023.
//

import UIKit

//MARK: - TableViewCell
class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    let cellLabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        
        return label
    }()
//    let cellButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
//        button.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupCell() {
        contentView.addSubview(cellLabel)
//        contentView.addSubview(cellButton)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
//            cellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
//            cellButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            cellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
//            cellButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
