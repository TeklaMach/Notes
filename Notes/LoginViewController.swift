//
//  LoginViewController.swift
//  Notes
//
//  Created by Tekla Matcharashvili on 05.11.23.
//

import UIKit

class LoginViewController: UIViewController {
    let keychain = KeychainService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if keychain.isUserLoggedIn() {
            navigateToNoteList()
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = "exampleUser"
        let password = "examplePassword"
        
        if validateLogin(username: username, password: password) {
            keychain.saveCredentials(username: username, password: password)
            
            if keychain.isFirstLogin() {
                showAlert(message: "Welcome to your first login!")
            }
            
            navigateToNoteList()
        } else {
            showAlert(message: "Invalid credentials")
        }
    }
    
    func validateLogin(username: String, password: String) -> Bool {
        return username == "exampleUser" && password == "examplePassword"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToNoteList() {
        let noteListVC = NoteListViewController()
        navigationController?.pushViewController(noteListVC, animated: true)
    }
}
