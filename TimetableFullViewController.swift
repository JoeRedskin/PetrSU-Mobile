//
//  TimetableFullViewController.swift
//  PetrSU Mobile
//
//  Created by User on 09/12/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class TimetableFullViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timetableTableView: UITableView!
    @IBOutlet weak var segmentWeek: UISegmentedControl!
    
    var timetable = [TimetableDay]()
    var number = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: переделать до 7, сделать подклассы для каждого дня
        
        return timetable[segmentWeek.selectedSegmentIndex].monday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimetableCell", for: indexPath) as! TimetableTableViewCell
        cell.displayLesson(lesson: timetable[segmentWeek.selectedSegmentIndex].monday[indexPath.row])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        GetTimetable().getTimetable(number: number){result in
            timetable = result
            timetableTableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    

 

}


