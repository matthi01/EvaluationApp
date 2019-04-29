import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventsTableView: UITableView!
    var allEvents : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        registerCells()
        configureTableView()
        allEvents = getAllEvents()
    }
    
    // table view code
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEvents.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.row < allEvents.count {
            cell = eventsTableView.dequeueReusableCell(withIdentifier: "eventTableViewCell", for: indexPath) as! EventTableViewCell
        } else if indexPath.row == allEvents.count  {
            cell = eventsTableView.dequeueReusableCell(withIdentifier: "addEventTableViewCell", for: indexPath) as! AddEventTableViewCell
        } else {
            cell = UITableViewCell()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == allEvents.count {
            performSegue(withIdentifier: "addEventSegue", sender: self)
        }
    }
    
    func configureTableView() {
        eventsTableView.rowHeight = UITableView.automaticDimension
        eventsTableView.estimatedRowHeight = 90.0
    }
    
    func registerCells() {
        eventsTableView.register(UINib(nibName: "AddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "addEventTableViewCell")
        eventsTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "eventTableViewCell")
    }
    
    func getAllEvents() -> [String] {
        let events = ["event-1", "event-2", "event-3"]
        return events
    }
}
