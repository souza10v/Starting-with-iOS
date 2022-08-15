//
//  ViewController.swift
//  PetControl
//
//  Created by Donizetti de Souza on 8/7/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePetList()
    }
    
    func configurePetList() {
        let animal1 = registroPet(name: "Iron", image: #imageLiteral(resourceName: "dog"), type: "Cachorro", birthday: "15 de Agosto de 2021")
        petList.append(animal1)
        let animal2 = registroPet(name: "Mel", image: #imageLiteral(resourceName: "cat"), type: "Gato", birthday: "10 de Julho de 2022")
        petList.append(animal2)
    } //#imageliteral(

    @IBAction func viewPetsButton(_ sender: Any) {
        let petListVC = PetListViewController()
        navigationController?.pushViewController(petListVC, animated: true)
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let petSignupVC = PetSignupViewController()
        navigationController?.pushViewController(petSignupVC, animated: true)
    }
    
    
}

