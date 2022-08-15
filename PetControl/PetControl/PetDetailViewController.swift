import UIKit

class PetDetailViewController: UIViewController {

    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var animalType: UILabel!
    @IBOutlet weak var petBirthdya: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
    let pet: registroPet
    
    init(selectedPet : registroPet){
        pet = selectedPet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes do Pet"
        petImage.image = pet.petImage
        petName.text = pet.petName
        animalType.text = pet.animalType
        petBirthdya.text = pet.petBirthday
        
        petImage.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor
        petImage.layer.borderWidth = 2
        petImage.layer.cornerRadius = petImage.frame.width/2
    }
}


