//
//  AddViewController.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 20.08.2023.
//

import UIKit

class AddViewController: UIViewController {
    
    weak var delegate: AddRecordDelegate?
    
    let dateLabel = CustomLabel(text: "Date and time of record:")
    let sysLabel = CustomLabel(text: "SYS Pressure of blood:")
    let diaLabel = CustomLabel(text: "DIA Pressure of blood:")
    let pulseLabel = CustomLabel(text: "Pulse:")
    let coommentLable = CustomLabel(text: "Comments:")
    
    let datePicker = UIDatePicker()
    let sysTextfield =  CustomTextField(placeholder: "Enter sys pressure here")
    let diaTextField = CustomTextField(placeholder: "Enter dia pressure here")
    let pulseTextField = CustomTextField(placeholder: "Enter pulse here")
    let commentTextField = CustomTextField(placeholder: "Enter comment if you need it")
    
    let stackView = UIStackView()
    let doneButton = CustomButton(bgColor: UIColor(red: 83/255, green: 232/255, blue: 97/255, alpha: 1), text: "Done")
    let cancelButton = CustomButton(bgColor: UIColor(red: 83/255, green: 126/255, blue: 221/255, alpha: 1), text: "Cancel")
    let okButton = CustomButton(bgColor: UIColor(red: 83/255, green: 126/255, blue: 221/255, alpha: 1), text: "OK")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configStackView()
        formSetup()
        buttonsSetup()
    }
    
    private func configStackView() {
        view.addSubview(stackView)
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = 30
        self.stackView.addArrangedSubview(doneButton)
        self.stackView.addArrangedSubview(cancelButton)
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func formSetup() {
        [
            dateLabel, datePicker,
            sysLabel, sysTextfield,
            diaLabel, diaTextField,
            pulseLabel, pulseTextField
        ].forEach {
            view.addSubview($0)
        }
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        datePicker.datePickerMode = .dateAndTime
        datePicker.date = Date()

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            dateLabel.heightAnchor.constraint(equalToConstant: 40),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            sysLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 40),
            sysLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            sysTextfield.topAnchor.constraint(equalTo: sysLabel.bottomAnchor, constant: 10),
            sysTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sysTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            diaLabel.topAnchor.constraint(equalTo: sysTextfield.bottomAnchor, constant: 40),
            diaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            diaTextField.topAnchor.constraint(equalTo: diaLabel.bottomAnchor, constant: 10),
            diaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            diaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            pulseLabel.topAnchor.constraint(equalTo: diaTextField.bottomAnchor, constant: 40),
            pulseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pulseTextField.topAnchor.constraint(equalTo: pulseLabel.bottomAnchor, constant: 10),
            pulseTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pulseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func buttonsSetup() {
        cancelButton.addTarget(self, action: #selector(didCancelTap), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(didDoneTap), for: .touchUpInside)
    }
    
    private func clearFields() {
        sysTextfield.text = ""
        diaTextField.text = ""
        pulseTextField.text = ""
    }
    
    @objc func didCancelTap() {
        clearFields()
        dismiss(animated: true)
    }
    
    @objc func didDoneTap() {
        //checkData
        //saveData
        guard let sysTextPressure = sysTextfield.text else {return}
        guard let diaTextPressure = diaTextField.text else {return}
        guard let pulseTextPressure = pulseTextField.text else {return}
        
        let newRecord = Record(date: datePicker.date, sysPressure: Int(sysTextPressure), diaPressure: Int(diaTextPressure) , pulse: Int(pulseTextPressure))
        //hide modal window
        self.delegate?.addNewRecord(newRecord: newRecord)
        clearFields()
        dismiss(animated: true)
    }
}
