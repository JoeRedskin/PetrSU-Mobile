//
//  TimetableTableViewCell.swift
//  PetrSU Mobile
//
//  Created by User on 09/12/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class TimetableTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelClassroom: UILabel!
    @IBOutlet weak var labelLecturer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func displayLesson(lesson: TimetableLesson){
        if let number = lesson.number{
            labelNumber.text = String(number)
        }
        if let timeS = lesson.startTime, let timeE = lesson.endTime{
            labelTime.text = String("\(timeS) - \(timeE)")
        }
        if let type = lesson.type{
            labelType.text = type
        }
        if let name = lesson.name{
            labelName.text = name
        }
        if let classroom = lesson.classroom{
            labelClassroom.text = classroom
        }
        if let lecturer = lesson.lecturer{
            labelLecturer.text = lecturer
        }
        
    }
}
