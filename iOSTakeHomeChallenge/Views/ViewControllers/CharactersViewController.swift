// Copyright © 2022 xDesign. All rights reserved.

import UIKit
import SwiftUI

class CharactersViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let viewModel = ViewModel()
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupBackgroundImage(view: view, image: "imgCharacters")
        viewModel.getCharacters(view: self, tableView: tableView)
        viewModel.setupSearchBar(searchBar: searchBar)
        setupDelegates()
        setupUI()
    }
    
    func setupDelegates() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupUI() {
        navigationItem.titleView = searchBar
    }
    
}

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.isSearching ? viewModel.filteredCharacters.count : viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        cell.setupWith(character: viewModel.isSearching ? viewModel.filteredCharacters[indexPath.row] : viewModel.characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let character = viewModel.characters[indexPath.row]
        let view = DetailCharacterView(character: character)
        let host = UIHostingController(rootView: view)
        navigationController?.pushViewController(host, animated: true)
    }
}

extension CharactersViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.isSearching = false
            viewModel.filteredCharacters.removeAll()
        } else {
            searchBar.setShowsCancelButton(true, animated: true)
            viewModel.isSearching = true
            viewModel.filteredCharacters = viewModel.characters.filter{ $0.name.range(of: searchText, options: .caseInsensitive) != nil }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.isSearching = false
        viewModel.filteredCharacters.removeAll()
        tableView.reloadData()
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
    
}
