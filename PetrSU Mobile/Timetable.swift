//
//  Timetable.swift
//  PetrSU Mobile
//
//  Created by User on 09/12/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import Foundation

struct Timetable: Codable {
    var denominator : TimetableDay
    var numerator : TimetableDay
}

struct TimetableDay : Codable {
    var monday = [TimetableLesson]()
    var tuesday = [TimetableLesson]()
    var wednesday = [TimetableLesson]()
    var thursday = [TimetableLesson]()
    var friday = [TimetableLesson]()
    var saturday = [TimetableLesson]()
    var sunday = [TimetableLesson]()
    
    private enum CodingKeys : String, CodingKey {
           case monday = "Monday"
           case tuesday = "Tuesday"
           case wednesday = "Wednesday"
           case thursday = "Thursday"
           case friday = "Friday"
           case saturday = "Saturday"
           case sunday = "Sunday"
       }
}


struct TimetableLesson : Codable {
    var classroom: String? = ""
    var number: String?
    var type: String? = ""
    var startTime: String? = ""
    var endTime: String? = ""
    var lecturer: String? = ""
    var name: String? = ""
    
    private enum CodingKeys : String, CodingKey {
        case classroom
        case number
        case startTime = "start_time"
        case endTime = "end_time"
        case lecturer
        case type
        case name
    }
}

