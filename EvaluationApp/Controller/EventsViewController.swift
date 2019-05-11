import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventsTableView: UITableView!
    var allEvents : [Event] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        registerCells()
        configureTableView()
        allEvents = getAllEvents()
        print(allEvents)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEvents.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var returnCell : UITableViewCell = UITableViewCell()
        
        if indexPath.row < allEvents.count {
            let cell = eventsTableView.dequeueReusableCell(withIdentifier: "eventTableViewCell", for: indexPath) as! EventTableViewCell
            
            let event = allEvents[indexPath.row]
            cell.name.text = event.name
            cell.location.text = event.location
            cell.rating.text = String(event.rating)
            
            if !event.reviewClosed {
                cell.setActiveBorder()
            }
            
            returnCell = cell
            
        } else if indexPath.row == allEvents.count  {
            let cell = eventsTableView.dequeueReusableCell(withIdentifier: "addEventTableViewCell", for: indexPath) as! AddEventTableViewCell
            
            returnCell = cell
            return returnCell
        }
        
        returnCell.selectionStyle = .none
        
        return returnCell
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
            if let nextViewController = segue.destination as? EventViewController {
                
                if let indexPath = eventsTableView.indexPathForSelectedRow {
                    nextViewController.segueEventName = allEvents[indexPath.row].name
                    nextViewController.segueEventLocation = allEvents[indexPath.row].location
                    nextViewController.segueReviewClosed = allEvents[indexPath.row].reviewClosed
                }
            }
        }
    }
    
    func configureTableView() {
//        eventsTableView.rowHeight = UITableView.automaticDimension
        eventsTableView.rowHeight = 100.0
        eventsTableView.estimatedRowHeight = 100.0
    }
    
    func registerCells() {
        eventsTableView.register(UINib(nibName: "AddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "addEventTableViewCell")
        eventsTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "eventTableViewCell")
    }
    
    func getAllEvents() -> [Event] {
        var events : [Event] = [Event]()
        
        let limit : Int = 5
        for index in 0...limit {
            let newEvent: Event = Event(name: "Event-\(index)", location: "location-\(index)", rating: 4.5, reviewClosed: false, time: Date())
            events.append(newEvent)
            
            if index % 2 == 0 {
                newEvent.reviewClosed = true
            }
        }
        return events
    }
}
