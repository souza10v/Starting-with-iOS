import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var animalType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        petImage.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor
        petImage.layer.borderWidth = 2
        petImage.layer.cornerRadius = petImage.frame.width/3
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        }
    }
