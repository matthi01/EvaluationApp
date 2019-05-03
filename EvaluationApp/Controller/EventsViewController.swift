import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventsTableView: UITableView!
    var allEvents : [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        registerCells()
        configureTableView()
        allEvents = getAllEvents()
        print(allEvents)
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
        } else {
            performSegue(withIdentifier: "eventClickedSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventClickedSegue" {
            print("this is working")
            if let nextViewController = segue.destination as? EventViewController {
                nextViewController.eventName = "some name"
                nextViewController.eventLocation = "some location"
                nextViewController.reviewClosed = "no"
            }
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
    
    func getAllEvents() -> [Event] {
        var events : [Event] = [Event]()
        
        let limit : Int = 5
        for index in 0...limit {
            let newEvent: Event = Event(name: "Event-\(index)", location: "location-\(index)", reviewClosed: false, time: Date())
            events.append(newEvent)
        }
        return events
    }
}
