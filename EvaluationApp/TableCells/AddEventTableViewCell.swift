import UIKit

class AddEventTableViewCell: UITableViewCell {
    @IBOutlet weak var cellContainer: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpCellContainer()
        setUpAddButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpCellContainer() {
        cellContainer.layer.cornerRadius = 25
        cellContainer.layer.borderWidth = 1
        cellContainer.layer.borderColor = UIColor.gray.cgColor
        cellContainer.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func setUpAddButton() {
        addButton.layer.cornerRadius = addButton.frame.width / 2
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.gray.cgColor
        addButton.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        print("add new event")
    }
    
}
