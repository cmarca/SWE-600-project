//
//  LoginViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let welcomeImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Pinspot"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Pinspot"
        return welcomeLabel
    }()

    let loginButton: UIButton = {
        let loginButton = Button.solidButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return loginButton
//        let loginButton = UIButton(type: UIButton.ButtonType.system)
//        loginButton.setTitle("Login", for: .normal)
//        loginButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
//        return loginButton
    }()

    let signUpButton: UIButton = {
        let signUpButton = UIButton(type: UIButton.ButtonType.system)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return signUpButton
    }()

    let usernameField: InputFieldView = {
        let usernameField = InputFieldView()
//        usernameField.borderStyle = .roundedRect
        usernameField.placeholder = "Username"
        return usernameField
    }()

    let passwordField: InputFieldView = {
        let passwordField = InputFieldView()
        passwordField.isSecureTextEntry = true
//        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Password"
        return passwordField
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = Style.Size.padding
        return stackView
    }()

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    var contentView = UIView()

    // Constraints
    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint?

    var activeField: UITextField?
    var activeView: UIView?
    var lastOffset: CGPoint?
    var keyboardHeight: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Style.Color.white

        self.view.addSubview(self.scrollView)
        self.scrollView.pinToEdgesOfSuperview()

        self.scrollView.addSubview(self.contentView)
        self.contentView.sizeWidthToWidth(of: self.scrollView)
        self.contentView.sizeHeightToHeight(of: self.scrollView)
        self.contentView.pinToTopEdgeOfSuperview()
        self.contentView.centerHorizontallyInSuperview()
        self.contentView.pinToBottomEdgeOfSuperview()

        self.contentView.addSubview(self.welcomeLabel)
        self.welcomeLabel.centerHorizontallyInSuperview()
        self.welcomeLabel.centerVerticallyInSuperview(withOffset: -Style.Size.largePadding * 2.0)

        self.contentView.addSubview(self.welcomeImage)
        self.welcomeImage.size(toWidth: Style.Size.control * 2.0)
        self.welcomeImage.size(toHeight: Style.Size.control * 2.0)
        self.welcomeImage.centerHorizontallyInSuperview()
        self.welcomeImage.positionAbove(self.welcomeLabel, withOffset: Style.Size.padding)

        self.contentView.addSubview(self.stackView)
        self.stackView.pinToSideEdgesOfSuperview(withOffset: Style.Size.largePadding)
        self.stackView.positionBelow(self.welcomeLabel, withOffset: Style.Size.largePadding)

        self.stackView.addArrangedSubview(self.usernameField)
        self.stackView.addArrangedSubview(self.passwordField)

        self.usernameField.size(toWidth: 300.0)
        self.passwordField.size(toWidth: 300.0)

        self.contentView.addSubview(self.loginButton)
        self.loginButton.pinToBottomEdgeOfSafeArea(withOffset: Style.Size.padding)
        self.loginButton.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)
        self.loginButton.size(toHeight: Style.Size.control)

        self.contentView.addSubview(self.signUpButton)
        self.signUpButton.pinToTopEdgeOfSafeArea(withOffset: Style.Size.padding)
        self.signUpButton.pinToRightEdgeOfSuperview(withOffset: Style.Size.padding)

        // Observe keyboard change
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)

        // Add touch gesture for contentView
        self.contentView.isUserInteractionEnabled = true
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnTextView(gesture:))))

    }

    @objc func didTapButton(_ button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController {
    @objc func returnTextView(gesture: UIGestureRecognizer) {
        self.usernameField.field.resignFirstResponder()
        self.passwordField.field.resignFirstResponder()
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        let currentOffset = self.scrollView.contentOffset
        UIView.animate(withDuration: 0.3) {
            var newOffset = currentOffset
            newOffset.y = 100.0
            self.scrollView.contentOffset = newOffset
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            var newOffset = self.scrollView.contentOffset
            newOffset.y = 0.0
            self.scrollView.contentOffset = newOffset
        }
    }
}
