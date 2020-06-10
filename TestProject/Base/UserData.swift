import Foundation

public class User {
    public var id: Int = 34098123
    public var name: String = "Anitta"
    public var code: String = "+7"
    public var phone: String = "9996155115"
    public var email: String = "Anita@gmail.com"
}


public struct PostingUserData: Codable {
    public var id: Int
    public var phone: String?
    public var email: String?
    
    init(id: Int, phone: String? = nil, email: String? = nil) {
        self.id = id
        self.phone = phone
        self.email = email
    }
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case phone = "phone"
        case email = "email"
    }
}
