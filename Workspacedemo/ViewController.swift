//
//  ViewController.swift
//  Workspacedemo
//
//  Created by Gordon Seto on 2017-09-10.
//  Copyright © 2017 gordonseto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // fetchData
        // displayData in tableView
        fetchPokemon()
    }
    
    func fetchPokemon(){
        // Hit the service layer
        PokemonService.getPokemon { (pokemon) in
            self.pokemons = pokemon
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        cell.configureCell(pokemon: pokemon)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle a tableView cell being clicked here
    }
}

