//
//  AddViewController.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 20.08.2023.
//

import UIKit

enum Type {
    case add
    case view
}

class AddViewController: UIViewController {
    
    weak var delegate: AddRecordDelegate?
    var formType: Type
    var record: RecordProtocol?
    
    let dateLabel = CustomLabel(text: "Date and time of record:")
    let sysLabel = CustomLabel(text: "SYS Pressure of blood:")
    let diaLabel = CustomLabel(text: "DIA Pressure of blood:")
    let pulseLabel = CustomLabel(text: "Pulse:")
    let commentLabel = CustomLabel(text: "Comment:")
    
    let datePicker = UIDatePicker()
    let sysTextField =  CustomTextField(placeholder: "Enter sys pressure here")
    let diaTextField = CustomTextField(placeholder: "Enter dia pressure here")
    let pulseTextField = CustomTextField(placeholder: "Enter pulse here")
    let commentTextView = CustomTextView()
    let scrollView = UIScrollView()
    
    init(type: Type, delegate: AddRecordDelegate?, record: RecordProtocol?) {
        self.formType = type
        self.delegate = delegate
        self.record = record
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .white
        view.keyboardLayoutGuide.followsUndockedKeyboard = true //Mark1
        basicFormSetup()
        switch formType {
        case .add:
            addFormConfig()
        case .view:
            viewFormConfig()
            
        }
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
        print("kbIsShowed")
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
        print("kbIsHided")
    }
    
    private func addFormConfig() {
        let stackView = UIStackView()
        let doneButton = CustomButton(bgColor: UIColor(red: 83/255, green: 232/255, blue: 97/255, alpha: 1), text: "Done")
        let cancelButton = CustomButton(bgColor: UIColor(red: 83/255, green: 126/255, blue: 221/255, alpha: 1), text: "Cancel")
        
        //MARK: - ConfigStackView
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = .orange
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.addArrangedSubview(doneButton)
        stackView.addArrangedSubview(cancelButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
//            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -10)
//            view.keyboardLayoutGuide.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1.0)
        ])
        //MARK: - Config Buttons
        cancelButton.addTarget(self, action: #selector(didCancelTap), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(didDoneTap), for: .touchUpInside)
    }
    
    private func viewFormConfig() {
        [
            datePicker,
            sysTextField,
            diaTextField,
            pulseTextField
        ].forEach {
            $0.isEnabled = false
        }
        commentTextView.isEditable = false
        
        guard let recordDate = record?.date else {return}
        datePicker.date = recordDate
        guard let recordSys = record?.sysPressure else {return}
        sysTextField.text = "\(recordSys)"
        guard let recordDia = record?.diaPressure else {return}
        diaTextField.text = "\(recordDia)"
        guard let recordPulse = record?.pulse else {return}
        pulseTextField.text = "\(recordPulse)"
        guard let recordComment = record?.comment else {return}
        commentTextView.text = "\(recordComment)"
        
        let okButton = CustomButton(bgColor: UIColor(red: 83/255, green: 126/255, blue: 221/255, alpha: 1), text: "OK")
        view.addSubview(okButton)
        NSLayoutConstraint.activate([
            okButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            okButton.widthAnchor.constraint(equalToConstant: 150),
            okButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        okButton.addTarget(self, action: #selector(didCancelTap), for: .touchUpInside)
    }
    
    private func basicFormSetup() {
        [
            dateLabel, datePicker,
            sysLabel, sysTextField,
            diaLabel, diaTextField,
            pulseLabel, pulseTextField,
            commentLabel, commentTextView
        ].forEach {
            view.addSubview($0)
        }
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        commentTextView.translatesAutoresizingMaskIntoConstraints = false

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

            sysTextField.topAnchor.constraint(equalTo: sysLabel.bottomAnchor, constant: 10),
            sysTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sysTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            diaLabel.topAnchor.constraint(equalTo: sysTextField.bottomAnchor, constant: 40),
            diaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            diaTextField.topAnchor.constraint(equalTo: diaLabel.bottomAnchor, constant: 10),
            diaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            diaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            pulseLabel.topAnchor.constraint(equalTo: diaTextField.bottomAnchor, constant: 40),
            pulseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pulseTextField.topAnchor.constraint(equalTo: pulseLabel.bottomAnchor, constant: 10),
            pulseTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pulseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            commentLabel.topAnchor.constraint(equalTo: pulseTextField.bottomAnchor, constant: 40),
            commentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            commentTextView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10),
            commentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            commentTextView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func clearFields() {
        sysTextField.text = ""
        diaTextField.text = ""
        pulseTextField.text = ""
        commentTextView.text = ""
    }
    
    @objc func didCancelTap() {
        clearFields()
        dismiss(animated: true)
    }
    
    @objc func didDoneTap() {
        //checkData
        //saveData
        guard let sysTextPressure = sysTextField.text else {return}
        guard let diaTextPressure = diaTextField.text else {return}
        guard let pulseTextPressure = pulseTextField.text else {return}
        guard let commentTextPressure = commentTextView.text else {return}
        
        let newRecord = Record(date: datePicker.date, sysPressure: Int(sysTextPressure), diaPressure: Int(diaTextPressure) , pulse: Int(pulseTextPressure), comment: commentTextPressure)
        self.delegate?.addNewRecord(newRecord: newRecord)
        clearFields()
        dismiss(animated: true)
    }
}
