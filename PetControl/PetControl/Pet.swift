import Foundation
import UIKit

class Pet{
    
    let name: String
    let dateBirth: String
    let specie: String
    var image: UIImage?
    
    init(petName: String, petDateBirth:String, petSpecie:String){
        name = petName
        dateBirth = petDateBirth
        specie = petSpecie
    }
}
