//
//  ListCardController.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 10/10/21.
//

import UIKit

class ListCardController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cardTableView: UITableView!
    var cardsMagicData : MagicCardModel?
    var selectedCard : Card?

    override func viewDidLoad() {
        super.viewDidLoad()

        SetListCardsData ()
    }
    
    func SetListCardsData ()
    {
        cardsMagicData = CacheVariablesHelper.Instantiate.GetListCard()
        
        if (cardsMagicData == nil)
        {
            Task.init{
                do{
                    let dataReceived = try await WebServiceManager.Instantiate.GetDataRequest(urlWebService: "https://api.magicthegathering.io/v1/cards", controllerUsed: self)
                    let decoder = JSONDecoder()
                    cardsMagicData = try decoder.decode(MagicCardModel.self, from: dataReceived)//decode de los datos recibidos
                    cardTableView?.reloadData()//recarga de la tabla
                    CacheVariablesHelper.Instantiate.SetListCard(listCardLoaded : cardsMagicData!)
                }
                catch {}
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1//Solo una sección
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberRows = 0
        
        if (cardsMagicData != nil)
        {
            numberRows = cardsMagicData!.cards.count
        }
            
        // #warning Incomplete implementation, return the number of rows
        return numberRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagicCardCell") as! MagicCardTableViewCell
        
        if (cardsMagicData != nil)
        {
            cell.cardNameLabel.text = cardsMagicData!.cards[indexPath.row].foreignNames?[1].name;
            cell.cardTypeLabel.text = cardsMagicData!.cards[indexPath.row].foreignNames?[1].type;
            cell.cardManaCostLabel.text = cardsMagicData!.cards[indexPath.row].manaCost;
            cell.cardPowerValueLabel.text = cardsMagicData!.cards[indexPath.row].power;
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Quitar la selección de la celda seleccionada
        tableView.deselectRow(at: indexPath, animated: false)
        
        //Guardo la carta seleccionada
        selectedCard = cardsMagicData!.cards[indexPath.row]
        
        // Lanzo el segue que llevará al detalle de la carta
        self.performSegue(withIdentifier: "GoToSelectedCardData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //le paso mediante el controlador destino del segue, la tarjeta seleccionada con todos sus datos
        let cardDetailController = segue.destination as! CardDetailController
        cardDetailController.cardData = selectedCard
    }
}
