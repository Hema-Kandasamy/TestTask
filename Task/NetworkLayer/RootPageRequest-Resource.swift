//
//  RootRequestResource.swift
//  Task
//
//  Created by Hemalatha K on 22/04/2021.
//  Copyright © 2021 HackerFactory. All rights reserved.
//

import Foundation

// Resources for Ntwork Request
struct RootRequestResource: NetworkEndpoint {

     typealias ResponseType = Root

     init() { }

     var relativeURLString: String {
        return "http://localhost:8000"
    }
}

// Response Model for above request
struct Root: Codable {
    let nextPath: String
    enum CondingKeys: String, CodingKey {
        case nextPath = "next_path"
    }
}
