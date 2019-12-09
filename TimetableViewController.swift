//
//  TimetableViewController.swift
//  PetrSU Mobile
//
//  Created by User on 09/12/2019.
//  Copyright © 2019 petrsu. All rights reserved.
//

import UIKit

class TimetableViewController: UIViewController {
    
    @IBOutlet weak var fieldTimetableNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func buttonClear(_ sender: Any) {
        fieldTimetableNumber.text = ""
    }
    
    @IBAction func buttonContinue(_ sender: Any) {
        if let number = fieldTimetableNumber.text{
            if validateGroupNumber(number: number){
                //TODO: отправка номера кода на получение расписания
                
//                performSegue(withIdentifier: "goToFull", sender: nil)
            } else {
                errorInvalidInput()
            }
        }
    }
    
    //TODO: сделать обнуление ошибки и дописать другие варианты ошибок
    func errorInvalidInput(){
        fieldTimetableNumber.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.1961684992)
        fieldTimetableNumber.attributedPlaceholder = NSAttributedString(string: "Неверно набран номер группы", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        fieldTimetableNumber.text = ""
    }
}
