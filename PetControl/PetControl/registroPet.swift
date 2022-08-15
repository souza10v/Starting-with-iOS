import Foundation
import UIKit

class registroPet{
    
    var petName: String
    var petImage: UIImage
    var animalType: String
    var petBirthday: String
    
    init(name: String, image: UIImage, type: String, birthday: String){
        petName = name
        petImage = image
        animalType = type
        petBirthday = birthday
    }
}
