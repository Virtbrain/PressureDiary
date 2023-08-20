//
//  AddViewController.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 20.08.2023.
//

import UIKit

class AddViewController: UIViewController {
    let datePicker = UIDatePicker()
    let sysTextfield =  UITextField()
    let diaTextField = UITextField()
    let pulseTextField = UITextField()
    
    let stackView = UIStackView()
    let doneButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        formSetup()
    }
    
    private func formSetup() {
        [datePicker, sysTextfield, diaTextField, pulseTextField, stackView].forEach {
            view.addSubview($0)
        }

        [sysTextfield, diaTextField, pulseTextField].forEach {
            $0.keyboardType = .numberPad
            $0.text = "0"
        }

        datePicker.datePickerMode = .dateAndTime
        datePicker.date = Date()

        stackView.addArrangedSubview(doneButton)
        stackView.addArrangedSubview(cancelButton)

        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40),
            datePicker.heightAnchor.constraint(equalToConstant: 100)

//            sysTextfield.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
//            sysTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            sysTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
//
//            diaTextField.topAnchor.constraint(equalTo: sysTextfield.bottomAnchor, constant: 10),
//            diaTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            diaTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
//
//            pulseTextField.topAnchor.constraint(equalTo: diaTextField.bottomAnchor, constant: 10),
//            pulseTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            pulseTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20)

//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension AddViewController: UITextFieldDelegate {
    //add only numbers check!
}
