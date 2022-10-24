//
//  Utilities.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import UIKit

struct Utilities {
    
    static func errorAlert(title: String, body: NetworkingError, viewController: UIViewController) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: body.rawValue, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            viewController.present(alert, animated: true)
        }
    }
    
}


enum HTTPMethod: String {
    
    // Multiple case can be added for scalability
    case get = "GET"
    
}
