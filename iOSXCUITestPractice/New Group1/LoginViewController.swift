//
//  LoginViewController.swift
//  iOSXCUITestPractice
//
//  Created by 坂本龍哉 on 2021/09/25.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        passwordTextField.resignFirstResponder()
    }

    @IBAction private func loginButtonDidTapped(_ sender: Any) {
        let topVC = UIStoryboard(name: "Top", bundle: nil).instantiateInitialViewController() as! TopViewController
        present(topVC, animated: true, completion: nil)
    }

}
