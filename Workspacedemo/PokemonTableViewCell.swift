//
//  PokemonTableViewCell.swift
//  Workspacedemo
//
//  Created by Gordon Seto on 2017-09-10.
//  Copyright © 2017 gordonseto. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    func configureCell(pokemon: Pokemon){
        titleLabel.text = pokemon.name
    }
}
