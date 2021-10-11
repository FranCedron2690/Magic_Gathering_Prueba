//
//  CardDetailController.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 10/10/21.
//

import UIKit

class CardDetailController: UIViewController {
    
    var cardData : Card?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print ("Recibido" + cardData!.name)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
//        if segue.destination is CardDetailController {
            let vc = segue.destination as? CardDetailController
            cardData = vc?.cardData
//        }
    }
    
}
