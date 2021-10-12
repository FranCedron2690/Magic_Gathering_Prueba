//
//  PresentationController.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 10/10/21.
//

import UIKit

class PresenttationContrtoller: UIViewController {
    
    //UI controllers
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var mailAuthorLabel: UILabel!
    @IBOutlet weak var dateRealizationDatePicker: UIDatePicker!
    
    //Static variables
    let authorName = "Francisco Jesús Cedrón Guillermo"
    let mailAuthor = "fran.j2690@hotmail.com"
    let dateRealizationSaved = "2016/10/10 13:00"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateRealizationDatePicker.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        SetInitialUIData ()
    }
    
    func SetInitialUIData ()
    {
        authorNameLabel.text = authorName
        mailAuthorLabel.text = mailAuthor
        dateRealizationDatePicker.date = SetDateRealization()
    }
    
    func SetDateRealization () -> Date
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2016/10/10 13:00")
        
        if (someDateTime != nil)
        {
            return someDateTime!
        }
        else
        {
            return Date.now
        }
    }

    @IBAction func OnTapGoToCards(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToListCards", sender: self)
        print("Navegando a listado de cartas")
    }
    
}
