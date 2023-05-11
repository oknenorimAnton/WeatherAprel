//
//  DecoderManager.swift
//  WeatherAprel
//
//  Created by Антон on 03.05.2023.
//

import Foundation

protocol Decoderable {
    func decode<T: Decodable>(data: Data) throws -> T
}

final class DecoderManager{}

extension DecoderManager: Decoderable {
    func decode<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
