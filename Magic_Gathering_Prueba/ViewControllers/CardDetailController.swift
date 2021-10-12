//
//  CardDetailController.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 10/10/21.
//

import UIKit

class CardDetailController: UIViewController {
    
    var cardData : Card?
    var nameCardDictionary : String? = ""
    
    @IBOutlet weak var nameCardLabel: UILabel!    
    @IBOutlet weak var imageCardImage: UIImageView!
    @IBOutlet weak var typeCardLabel: UILabel!
    @IBOutlet weak var textDescriptionCardLabel: UILabel!
    @IBOutlet weak var manaCardLabel: UILabel!
    @IBOutlet weak var powerCardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SettDataCard ()
        SetImageCard ()
    }
    
    func SetImageCard ()
    {
        nameCardDictionary = cardData?.name;
        imageCardImage?.image = CacheVariablesHelper.Instantiate.GetImageCardByName(nameCard: nameCardDictionary!)
        
        if (imageCardImage?.image == nil && cardData?.imageURL != nil)
        {
            Task.init{
                do{
                    let dataReceived = try await WebServiceManager.Instantiate.GetDataRequest(urlWebService: cardData?.imageURL as! String, controllerUsed: self)
                    let imageCard = UIImage(data: dataReceived)
                    imageCardImage.image = imageCard
                    CacheVariablesHelper.Instantiate.AddImageCard(nameCard: (nameCardDictionary!), imageCardUI: imageCard!)
                }
                catch {
                    print("Error (CardDetailController/SetImageCard): \(error) ")
                }
            }
        }
    }
    
    func SettDataCard ()
    {
        nameCardLabel.text = cardData?.foreignNames?[1].name
        typeCardLabel.text = cardData?.foreignNames?[1].type
        textDescriptionCardLabel.text = cardData?.foreignNames?[1].text
        manaCardLabel.text = cardData?.manaCost
        powerCardLabel.text = cardData?.power
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CardDetailController {
            let vc = segue.destination as? CardDetailController
            cardData = vc?.cardData
        }
    }
}
