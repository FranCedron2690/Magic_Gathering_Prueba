//
//  CacheVariablesHelper.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 12/10/21.
//

import UIKit

class CacheVariablesHelper: NSObject {
    
    //Singleton
    static let Instantiate = CacheVariablesHelper()
    
    override private init() {}
    //
    
    private var cardsMagicData : MagicCardModel? = nil
    private var imagesCardsDictionary : [String : UIImage] = [:]
    
    //List Card Data
    func GetListCard () -> MagicCardModel?
    {
        return cardsMagicData
    }
    
    func SetListCard (listCardLoaded : MagicCardModel)
    {
        cardsMagicData = listCardLoaded
    }
    
    //Images
    func GetImageCardByName (nameCard: String) -> UIImage?
    {
        let image : UIImage? = imagesCardsDictionary[nameCard]
        return image
    }
    
    func AddImageCard (nameCard: String, imageCardUI: UIImage)
    {
        imagesCardsDictionary[nameCard] = imageCardUI
    }
}
