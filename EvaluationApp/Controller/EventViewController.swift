import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var reviewClosed: UILabel!
    
    var segueEventName: String = ""
    var segueEventLocation: String = ""
    var segueReviewClosed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventName.text = segueEventName
    }
}
