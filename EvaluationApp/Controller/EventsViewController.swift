//
//  EventsViewController.swift
//  EvaluationApp
//
//  Created by Matthias Ruhland on 2019-04-27.
//  Copyright © 2019 Matthias Ruhland. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        
        eventsTableView.register(UINib(nibName: "AddEventTableViewCell", bundle: nil), forCellReuseIdentifier: "addEventTableViewCell")
        
        configureTableView()
    }
    
    
    
    // table view code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: "addEventTableViewCell", for: indexPath) as! AddEventTableViewCell
        
        return cell
    }
    
    func configureTableView() {
        eventsTableView.rowHeight = UITableView.automaticDimension
        eventsTableView.estimatedRowHeight = 90.0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
