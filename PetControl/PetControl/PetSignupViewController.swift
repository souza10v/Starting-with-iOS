import UIKit

var petList: [registroPet] = []

class PetSignupViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var specieField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupImageView()
    }
    
    func setupTextFields(){
        nameTextField.delegate = self
        birthDateTextField.delegate = self
        specieField.delegate = self
    }
    
    @IBAction func uploadButton(_ sender: Any) {
        let alert = UIAlertController(title: "Pets", message: "Selecione uma opção", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        alert.addAction(cameraButton)
        
        let libraryButton = UIAlertAction(title: "Biblioteca de fotos", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        alert.addAction(libraryButton)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let name = nameTextField.text
        let birthDate = birthDateTextField.text
        let specie = specieField.text
    
        guard let petName = name, petName != "" else {
            presentMessage(message: "Campo nome deve ser preenchido")
            return
        }
        guard let petBirthDate = birthDate, petBirthDate != "" else {
            presentMessage(message: "Campo data de aniversário deve ser preenchido")
            return
        }
        guard let specieName = specie, specieName != "" else {
            presentMessage(message: "Campo espécie deve ser preenchido")
            return
        }
        
        var image: UIImage
        if let petImage = imageView.image{
            image = petImage
        }else{
                image = #imageLiteral(resourceName: "png-transparent-animal-foot-print-dog-paw-footprints-miscellaneous-animals-pet")
            }
        
        let pet = registroPet(name: petName, image: image, type: specieName, birthday: petBirthDate)
        petList.append(pet)
        presentMessage(message: "Pet Cadastrado")
    }
    
    func presentMessage(message: String){
        let alert = UIAlertController(title: "Cadastro Pet", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    func setupImageView(){
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor
        imageView.layer.cornerRadius = imageView.frame.width/2
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[.originalImage] as? UIImage
        imageView.image = image
    }
}
