//
//  ViewController.swift
//  ContadorDoTrem
//
//  Created by Donizetti de Souza on 8/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    var counter: Int = 0

    @IBAction func addPerson(_ sender: Any) {
        if(counter == 10){
            counterLabel.text = "Max"
            
        } else{
            counter += 1
            counterLabel.text =  "\(counter)"
        }

    }
    
    @IBAction func removePerson(_ sender: Any) {
        if(counter == 0){
            counterLabel.text =  "Min"
        } else{
            counter -= 1
            counterLabel.text =  "\(counter)"
        }

    }
}
