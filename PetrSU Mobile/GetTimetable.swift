//
//  GetTimetable.swift
//  PetrSU Mobile
//
//  Created by User on 09/12/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import Foundation


class GetTimetable {
    
    var timetable = [TimetableDay]()
    var link = "https://petrsu.egipti.com/api/v1/schedule/"
    var link2 = "https://petrsu.egipti.com/api/v1/schedule/22207"
    var test = "https://jsonplaceholder.typicode.com/todos"
    
    func getTimetable(number: String, completion: ((_ result: [TimetableDay]) -> Void)){
        //        guard let url = URL(string: test) else {return}
        //        guard let url = URL(string: String("\(link)\(number)")) else {return}
        guard let url = URL(string: String("\(link)22207")) else {return}
        //print("dsdsds")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                // data we are getting from network request
                let decoder = JSONDecoder()
                let response = try decoder.decode(Timetable.self, from: dataResponse)
                print(response)
                self.timetable.append(response.denominator)
                self.timetable.append(response.numerator)
            } catch { print(error) }
            
        }
        task.resume()
        completion(self.timetable)
    }
}
