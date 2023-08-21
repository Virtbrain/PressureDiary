//
//  CustomLabel.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 20.08.2023.
//

import UIKit

//MARK: - CustomLabel
class CustomLabel: UILabel {
    
    //MARK: - Initializers
    init(text: String) {
        super.init(frame: .zero)
        setupLabel(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupLabel(text: String) {
        font = .boldSystemFont(ofSize: 20)
        self.text = text
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
