//
//  ListCardController.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 10/10/21.
//

import UIKit

class ListCardController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cardsMagicData : MagicCardModel?
    var selectedCard : Card?

    override func viewDidLoad() {
        super.viewDidLoad()

        let decoder = JSONDecoder()
        do{
            let data = try decoder.decode(MagicCardModel.self, from: ResponseCardsData.jsonDataCardsJsonResponseWeb)
            cardsMagicData = data
            print ("Cargadas las cartas correctamente!!")            
        }
        catch {
            print(error)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1//Solo una sección
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cardsMagicData!.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagicCardCell") as! MagicCardTableViewCell
        
        cell.cardName.text = cardsMagicData!.cards[indexPath.row].foreignNames?[1].name;
        cell.cardType.text = cardsMagicData!.cards[indexPath.row].foreignNames?[1].type;
        cell.cardManaCost.text = cardsMagicData!.cards[indexPath.row].manaCost;
        cell.cardPowerValue.text = cardsMagicData!.cards[indexPath.row].power;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
