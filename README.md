# MockGenerator
Helper class for generation mock objects

###How to use###
  * Add MockGenerator.swift to project
  * Your model should conform "MockGeneratorProtocol" and implement createMockObject method

###Example:###

```
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
```

###Generate mock objects example:###

```
  var users = [User]()
  users = User().createMockObjects(30)
```

###Types and source###
To edit mock data types and source - change MockData enum
