import UIKit

class PetListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellId = "cellid"
    @IBOutlet weak var tableViewListPets: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    func configureTableView() {
        tableViewListPets.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableViewListPets.dataSource = self
        tableViewListPets.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PetTableViewCell
        let row = indexPath.row
        let pet = petList[row]
        cell.animalType.text = pet.animalType
        cell.nameLabel.text = pet.petName
        cell.petImage.image = pet.petImage
        tableView.backgroundColor = UIColor.clear
        
        cell.contentView.backgroundColor = UIColor.clear //deixar transparente
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
   
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let pet = petList[row]
        let petDetailVC = PetDetailViewController(selectedPet: pet)
        navigationController?.pushViewController(petDetailVC, animated: true)
    }
}
