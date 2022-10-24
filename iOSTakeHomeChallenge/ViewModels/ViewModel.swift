//
//  ViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Rui on 24/10/2022.
//

import UIKit

class ViewModel {
    
    var characters: [Character] = []
    var filteredCharacters: [Character] = []
    
    var isSearching = false
    
    func getCharacters(view: UIViewController, tableView: UITableView) {
        NetworkRequest.shared.request { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    print(result)
                    self.characters = result
                    tableView.reloadData()
                }
            case .failure(let error):
                Utilities.errorAlert(title: "Oh no!", body: error, viewController: view)
            }
        }
    }
    
    func setupBackgroundImage(view: UIView, image: String) {
        let background = UIImage(named: image)

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    func setupSearchBar(searchBar: UISearchBar) {
        searchBar.searchTextField.textColor = UIColor(named: "Gray")
        searchBar.tintColor = UIColor(named: "Gray")
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString.init(string: "Search", attributes: [.foregroundColor:UIColor(named: "Gray")!])
        searchBar.sizeToFit()
    }
}
