//
//  UITableView.swift
//  WeatherAprel
//
//  Created by Антон on 17.05.2023.
//

import UIKit

extension UITableView {
    func register(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}
