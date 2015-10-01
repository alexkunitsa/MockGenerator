//
//  User+Mock.swift
//  MockGeneratorSample
//
//  Created by Alex Kunitsa on 10/1/15.
//  Copyright © 2015 Alex Kunitsa. All rights reserved.
//

import Foundation

extension User: MockGeneratorProtocol {

    typealias ItemType = User

    func createMockObject() -> User {
        let user = User()
        
        if let name = MockGenerator.createMockData(.Name) as? String {
            user.name = name
        }
        
        if let email = MockGenerator.createMockData(.Email) as? String {
            user.email = email
        }
        
        return user
    }
}