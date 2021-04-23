//
//  LineLevelUsageMocks.swift
//  TelenetTests
//
//  Created by Deepak Shukla on 01/04/2020.
//  Copyright © 2020 Telenet. All rights reserved.
//

import Foundation
@testable import Task

struct MockRoot {
    
    static let responseData = """
    {
        "next_path": "http://localhost:8000/path/",
        "response_code": "9e49d810-3fd1-4b5e-abc6-0952532a966b"
    }
    """.data(using: .utf8)

}

struct MockContent {

    static let responseData = """
    {
        "response_code": "9e49d810-3fd1-4b5e-abc6-0952532a966b"
    }
    """.data(using: .utf8)

}

struct MockInvalidData {
    static let responseData = """
    {
        "key": "9e49d810-3fd1-4b5e-abc6-0952532a966b"
    }
    """.data(using: .utf8)
}




