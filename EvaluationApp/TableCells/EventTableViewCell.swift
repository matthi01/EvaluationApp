import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var innerCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(cell : UITableViewCell) {
        innerCell.backgroundColor = UIColor.orange
        innerCell.layer.cornerRadius = 15.0
        innerCell.layer.borderWidth = 2.0
        innerCell.layer.borderColor = UIColor.black.cgColor
    }
    
    func setActiveBorder() {
        print("Setting the border to active")
        innerCell.layer.borderColor = UIColor.green.cgColor
    }
}
