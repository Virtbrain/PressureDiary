//
//  TableViewCell.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 18.08.2023.
//

import UIKit
//MARK: - TableViewCell
class TableViewCell: UITableViewCell {
    let cellLabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let cellButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Private Methods
    private func setupCell() {
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellButton)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellLabel.widthAnchor.constraint(equalToConstant: 100),
            
            cellButton.leadingAnchor.constraint(equalTo: cellLabel.trailingAnchor, constant: 10),
            cellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 5),
            cellButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
        ])
        
    }

}
