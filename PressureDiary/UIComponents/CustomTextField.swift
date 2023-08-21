//
//  TextField.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 20.08.2023.
//

import UIKit

//MARK: - CustomTextField
class CustomTextField : UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    //MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    //MARK: - Private Methods
    private func setupTextField(placeholder: String) {
        textColor = .black
        keyboardType = .numberPad
        
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor(red: 238/255, green: 232/255, blue: 230/255, alpha: 0.7).cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.opacity = 1
        layer.shadowOffset = CGSize(width: 9, height: 9)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        
        font = .boldSystemFont(ofSize: 15)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
