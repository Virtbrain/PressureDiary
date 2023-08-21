//
//  CustomButton.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 21.08.2023.
//

import UIKit

//MARK: - CustomButton
class CustomButton: UIButton {
    //MARK: - Initializers
    init(bgColor: UIColor, text: String) {
        super.init(frame: .zero)
        backgroundColor = bgColor
        setTitle(text, for: .normal)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
    }
    
}

