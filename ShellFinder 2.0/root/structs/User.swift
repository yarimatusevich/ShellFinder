import Foundation

class User {
    private let name: String
    private let id: String // user name, unique to every user
    private var password: String
    private var numberOfIdenifications: Int // Number of identifications
    
    init(name: String, id: String, password: String, numberOfIdenifications: Int) {
        self.name = name
        self.id = id
        self.password = password
        self.numberOfIdenifications = numberOfIdenifications
    }
    
    public func getName() -> String {
        return name
    }
    
    public func getId() -> String {
        return id
    }
    
    public func getNumberOfIdentifications() -> Int {
        return numberOfIdenifications
    }
    
    public func getPassword() -> String {
        return password
    }
    
    public func setPassword(password: String) {
        self.password = password
    }
    
    public func setNumberOfIdentifications(number: Int) {
        self.numberOfIdenifications = number
    }
}
