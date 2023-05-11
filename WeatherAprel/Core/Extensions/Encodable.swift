//
//  Encodable.swift
//  WeatherAprel
//
//  Created by Антон on 10.05.2023.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String:Any] {
        var dict = [String:Any]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            guard let key = child.label else { continue }
            let childMirror = Mirror(reflecting: child.value)
            
            switch childMirror.displayStyle {
            case .struct, .class:
                let childDict = (child.value as! Encodable).asDictionary()
                dict[key] = childDict
            case .collection:
                let childArray = (child.value as! [Encodable]).map({ $0.asDictionary() })
                dict[key] = childArray
            case .set:
                let childArray = (child.value as! Set<AnyHashable>).map({ ($0 as! Encodable).asDictionary() })
                dict[key] = childArray
            default:
                dict[key] = child.value
            }
        }
        return dict
    }
}
