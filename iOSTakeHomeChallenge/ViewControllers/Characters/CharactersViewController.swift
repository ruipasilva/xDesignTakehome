// Copyright © 2022 xDesign. All rights reserved.

import Foundation
import UIKit

class CharactersViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let viewModel = ViewModel()
    var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupBackgroundImage(view: view, image: "imgCharacters")
        viewModel.getCharacters(tableView: tableView)
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
}

extension CharactersViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.isSearching = false
            view.endEditing(true)
            viewModel.filteredCharacters.removeAll()
        } else {
            viewModel.isSearching = true
            viewModel.filteredCharacters = viewModel.characters.filter{ $0.name.range(of: searchText, options: .caseInsensitive) != nil }
        }
        tableView.reloadData()
    }
}
