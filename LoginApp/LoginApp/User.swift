import Foundation
import UIKit

class User {
    
    let name: String
    let email: String
    let password: String
    var image: UIImage? // ? signfica que eh um valor opcional e var tbm necessario
    
    init(userName: String, userEmail: String, userPassword: String){ //usa se init pois alguerem irar passar o valor
        name = userName
        email = userEmail
        password = userPassword
    }
    
}
