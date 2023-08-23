//
//  CustomTextView.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 23.08.2023.
//

import UIKit

class CustomTextView: UITextView {
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        self.setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupTextView() {
        textColor = .black
        
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor(red: 238/255, green: 232/255, blue: 230/255, alpha: 0.7).cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.opacity = 1
        layer.shadowOffset = CGSize(width: 9, height: 9)
        
        font = .boldSystemFont(ofSize: 15)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
