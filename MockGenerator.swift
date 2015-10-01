//
//  MockGenerator.swift
//  MockGenerator
//
//  Created by Alex Kunitsa on 9/23/15.
//  Copyright © 2015 Alex Kunitsa. All rights reserved.
//

import Foundation

/// Enum with mock data that will be used for random results. Add new options if needed
enum MockData: Int {
    case Email, Name
    
    static let items = [
        Email : ["hero@g.com", "2015@g.com"],
        Name : ["Wolverine", "Thing", "Beast", "Gambit", "Hulk", "Iron Man"]
    ]
}

/**
*  Protocol that should be implemented by model to be able create mock object
*/
protocol MockGeneratorProtocol {
    
    typealias ItemType
    
    /**
    Create mock object. Model should contain that method to be able create mock objects
    
    - returns: mock objects
    */
    func createMockObject() -> ItemType
    
    /**
    Create collection of n mock objects
    
    - parameter amount: amount of objects that should be generated
    
    - returns: mock objects collection
    */
    func createMockObjects(amount: Int) -> [ItemType]
}

// MARK: - Add default behaviour
extension MockGeneratorProtocol {
    
    func createMockObjects(amount: Int) -> [ItemType] {
        var objects = [ItemType]()
        if amount == 0 {
            return objects
        }
        
        for _ in 1...amount {
            let object = createMockObject()
            objects.append(object)
        }
        
        return objects
    }
}

/// Class that is used for mock data creation
class MockGenerator {
    
    /**
    Create mock data object. Random value will be get from MockData enum
    
    - parameter type: data type
    
    - returns: generated mock object
    */
    class func createMockData(type: MockData) -> AnyObject? {
        if let sourceItems = MockData.items[type] {
            let randomIndex = Int(arc4random_uniform(UInt32(sourceItems.count)))
            return sourceItems[randomIndex]
        }
        
        return nil
    }
}