//
//  JSONParser.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import Foundation

final class JSONParser<T: Decodable> {
    // MARK: Decoding
    static func objectWithoutKey(from data: Data) throws -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {
           // print(error)
            throw error
        }
    }
}
