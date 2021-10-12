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
        imageCardImage?.image = CacheVariablesHelper.DataCacheVariables.GetImageCardByName(nameCard: nameCardDictionary!)
        
        if (imageCardImage?.image == nil && cardData?.imageURL != nil)
        {
            let urlImage : URL = URL(string: cardData?.imageURL as! String )!
            downloadImage(from: urlImage)
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
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                let imageCard = UIImage(data: data)
                self?.imageCardImage.image = imageCard
                CacheVariablesHelper.DataCacheVariables.AddImageCard(nameCard: (self?.nameCardDictionary!)!, imageCardUI: imageCard!)
            }
        }
    }
}
