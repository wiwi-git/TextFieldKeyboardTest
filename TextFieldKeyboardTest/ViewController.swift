//
//  ViewController.swift
//  TextFieldKeyboardTest
//
//  Created by 위대연 on 2021/03/30.
//

import UIKit

class ViewController: UIViewController {
    var userNameTextField:UITextField!
    var nickNameTextField:UITextField!
    var pwTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: 40)
        
        self.userNameTextField = self.createTextField(frame: frame, textType: .username)
        self.nickNameTextField = self.createTextField(frame: frame, textType: .nickname)
        self.pwTextField = self.createTextField(frame: frame, textType: .password)
        self.pwTextField.isSecureTextEntry = true
        self.pwTextField.keyboardType = .alphabet
        
        
        let textFieldStackView = UIStackView()
        textFieldStackView.addArrangedSubview(self.userNameTextField)
        textFieldStackView.addArrangedSubview(self.nickNameTextField)
        textFieldStackView.addArrangedSubview(self.pwTextField)
        textFieldStackView.axis = .vertical
        textFieldStackView.distribution = .equalSpacing
        textFieldStackView.spacing = 20
        textFieldStackView.alignment = .center
        self.view.addSubview(textFieldStackView)
        
        
        /// layout
        let safe = self.view.safeAreaLayoutGuide
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.userNameTextField.heightAnchor.constraint(equalToConstant: frame.height),
            self.userNameTextField.widthAnchor.constraint(equalToConstant: frame.width),
            self.nickNameTextField.heightAnchor.constraint(equalToConstant: frame.height),
            self.nickNameTextField.widthAnchor.constraint(equalToConstant: frame.width),
            self.pwTextField.heightAnchor.constraint(equalToConstant: frame.height),
            self.pwTextField.widthAnchor.constraint(equalToConstant: frame.width),
            
            textFieldStackView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 20),
            textFieldStackView.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant:  20),
            textFieldStackView.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -20)
        ])
    }

    func createTextField(frame:CGRect, textType: UITextContentType) -> UITextField {
        let tf = UITextField(frame: frame)
        tf.textAlignment = .left
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.textContentType = textType
        tf.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return tf
    }

}

