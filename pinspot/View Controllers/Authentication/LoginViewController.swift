//
//  LoginViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome"
        return welcomeLabel
    }()

    let loginButton: UIButton = {
        let loginButton = UIButton(type: UIButton.ButtonType.system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return loginButton
    }()

    let signUpButton: UIButton = {
        let signUpButton = UIButton(type: UIButton.ButtonType.system)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return signUpButton
    }()

    let usernameField: UITextField = {
        let usernameField = UITextField(frame: .zero)
        usernameField.borderStyle = .roundedRect
        usernameField.placeholder = "Username"
        return usernameField
    }()

    let passwordField: UITextField = {
        let passwordField = UITextField(frame: .zero)
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Password"
        return passwordField
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = Style.Size.smallPadding
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Style.Color.white

        self.view.addSubview(self.welcomeLabel)
        self.welcomeLabel.centerHorizontallyInSuperview()
        self.welcomeLabel.centerVerticallyInSuperview(withOffset: -Style.Size.largePadding * 2.0)

        self.view.addSubview(self.stackView)
        self.stackView.pinToSideEdgesOfSuperview(withOffset: Style.Size.largePadding)
        self.stackView.positionBelow(self.welcomeLabel, withOffset: Style.Size.largePadding)

        self.stackView.addArrangedSubview(self.usernameField)
        self.stackView.addArrangedSubview(self.passwordField)

        self.usernameField.size(toWidth: 300.0)
        self.passwordField.size(toWidth: 300.0)

        self.view.addSubview(self.loginButton)
        self.loginButton.pinToBottomEdgeOfSafeArea(withOffset: Style.Size.padding)
        self.loginButton.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)

        self.view.addSubview(self.signUpButton)
        self.signUpButton.pinToTopEdgeOfSafeArea(withOffset: Style.Size.padding)
        self.signUpButton.pinToRightEdgeOfSuperview(withOffset: Style.Size.padding)
    }

    @objc func didTapButton(_ button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
