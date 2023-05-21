//
//  UITableViewCell.swift
//  WeatherAprel
//
//  Created by Антон on 15.05.2023.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
