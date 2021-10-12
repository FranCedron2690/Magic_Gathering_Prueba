//
//  WebServiceManager.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 12/10/21.
//

import UIKit
import Alamofire

class WebServiceManager: NSObject {
    
    //Singleton
    static let Instantiate = WebServiceManager()
    
    private override init() {}
    //
    
    func GetDataRequest (urlWebService: String, controllerUsed: UIViewController) async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            AF.request(urlWebService, method: .get).validate().responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        continuation.resume(returning: data)
                        print ("CORRECTO Get HTTP : \(urlWebService)")
                        return
                    }
//                    }
                case let .failure(error):
                    self.ShowAlertError(messageError: error.errorDescription!, controller: controllerUsed)
                    print ("ERROR Get HTTP : \(urlWebService). Error:\(error)) ")
                }
            }
        }
    }
    
    func ShowAlertError (messageError: String, controller: UIViewController)
    {
        let alert = UIAlertController(title: "Error al ejecutar el serbservice", message: messageError, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
        controller.present(alert, animated: true)
    }
}
