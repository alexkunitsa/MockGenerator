//
//  TestVM.swift
//  MockGeneratorSample
//
//  Created by Alex Kunitsa on 10/1/15.
//  Copyright © 2015 Alex Kunitsa. All rights reserved.
//

import Foundation

protocol TestVMDelegate: class {

    func dataUpdated()
}

class TestVM {
    
    var users = [User]()
    
    weak var delegate: TestVMDelegate?
    
    // MARK: - Public
    
    func generateUsersList() {
        users.removeAll()
        users = User().createMockObjects(30)
        
        delegate?.dataUpdated()
    }
}