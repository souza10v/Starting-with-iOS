//
//  ViewController.swift
//  LoginApp
//
//  Created by Donizetti de Souza on 8/9/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //carrega view login
    @IBAction func goToLogin(_ sender: Any) {
        let loginVC = loginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    // carrega view de cadastro
    @IBAction func goToSingup(_ sender: Any) {
        let singupVC = SingupViewController()
        navigationController?.pushViewController(singupVC, animated: true)
    }
}

