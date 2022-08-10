import UIKit

class SingupViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //campos texto
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var emailTextFiedl: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passawordConfirmTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    //carrega para tela
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    //estar coletando e atualizando oscampos textos
    func setupTextFields(){
        nameTextFiled.delegate = self  //determina que ira escutar, detectar atualizacao no teclado
        emailTextFiedl.delegate = self
        passwordTextField.delegate = self
        passawordConfirmTextField.delegate = self
    }
    
    //quando o botao do teclado return for pressionado o que fazer
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //nameTextFiled.resignFirstResponder()  //esconder teclado em nametextfield
        textField.resignFirstResponder() //esconde o teclado para todas que chamam a funcao
        return true
    }
    
    //botao upload imagem
    @IBAction func uplotedButoon(_ sender: Any) {
        let alert = UIAlertController(title: "App de login", message: "Selecione uma opção", preferredStyle: .actionSheet) // abre popup pequeno para escolha
        
        //adicionar botoes no popup
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { _ in
            let imagePicker = UIImagePickerController() // abrir carregador de imagens
            imagePicker.delegate = self // para ouvir atualizacoes de eventos
            imagePicker.sourceType = .camera // carrega a camera para upload de imagem
            self.present(imagePicker, animated: true, completion: nil)
        }
        alert.addAction(cameraButton)
        
        let libraryButton = UIAlertAction(title: "Biblioteca", style: .default) { _ in
            let imagePicker = UIImagePickerController() // abrir carregador de imagens
            imagePicker.delegate = self // para ouvir atualizacoes de eventos
            imagePicker.sourceType = .photoLibrary // carrega a biblioteca para upload de imagem
            self.present(imagePicker, animated: true, completion: nil)
        }
        alert.addAction(libraryButton)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil) // exibe mensagem para selecionar camera ou biblioteca

    }
    
    //botao cadastro
    @IBAction func signupButton(_ sender: Any) {
        let name = nameTextFiled.text
        let email = emailTextFiedl.text
        let password = passwordTextField.text
        
        guard let userName = name, userName != "" else { //garanta que, o nome nao seja nil e que o campo seja diferente de vazio, se nao for mostra popup
            presentMessage(message: "Campo nome deve ser preenchido")
            return
        }
        
        guard let userEmail = email, userEmail != "" else {
            presentMessage(message: "Campo email deve ser preencido")
            return
        }
        
        guard let userPassword = password, userPassword != "" else {
            presentMessage(message: "Campo senha deve ser preencido")
            return
        }
        
        guard let userPassawordConf = passawordConfirmTextField.text , userPassawordConf != "" else {
            presentMessage(message: "Campo de confirmação de senha deve ser preenchido")
            return
        }
        
        //obriga a carregar uma imagem
//        guard let userImage = imageView.image else {
//            presentMessage(message: "Campo de image deve ser preenchido")
//            return
//        }
        
        guard userPassawordConf == userPassword else {
            presentMessage(message: "As senhas devem ser iguais")
            return
        }
        
        let user = User(userName: userName, userEmail: userEmail, userPassword: userPassword)
        user.image = imageView.image
        
        presentMessage(message: "Usuaário \(userName) cadastrado")
    }
        
    func presentMessage(message: String){
        let alert = UIAlertController(title: "App de login", message: message, preferredStyle: .alert) //define o alerta
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil) //  handler) solicitar um bloco de codigo quando for executado
        alert.addAction(okButton) // adicona no botao no popup
        present(alert, animated: true, completion: nil) // exibe o alerta com uma viewcontroller
    }
    
    //funcao chamada quando se seleciona alguma midia da biblioteca
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage //captura algumas informacoes da imagem. converte o encontrado para imagem, porem de forma opcional por isso ?
        if let image = selectedImage { //verifica se a imagem foi carregada com sucesso
            imageView.image = image // carrega imagem para imageview
        } else {
            presentMessage(message: "O arquivo selecionado deve ser uma imagem")
        }
        picker.dismiss(animated: true, completion: nil) // ao selecionar a imagem esconder a biblioteca
    }
}
