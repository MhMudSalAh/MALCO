//
//  User.swift
//  MALCO
//
//  Created by MhMuD SalAh on 04/02/2021.
//

import UIKit

class User: NSObject, NSCoding, Codable {

    var id: Int = 0
    var name: String = ""
    var email: String? = ""
    var phone: String? = ""
    var image: String? = ""
   
    
    override init() {
        super.init()
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "username")
        coder.encode(email, forKey: "email")
        coder.encode(phone, forKey: "phone")
        coder.encode(image, forKey: "image")
        
    }
    
    required init?(coder: NSCoder) {
        self.id = coder.decodeObject(forKey: "id") as? Int ?? 0
        self.name = coder.decodeObject(forKey: "username") as? String ?? ""
        self.email = coder.decodeObject(forKey: "email") as? String ?? ""
        self.phone = coder.decodeObject(forKey: "phone") as? String ?? ""
        self.image = coder.decodeObject(forKey: "image") as? String
      
    }
}

extension User {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name = "username"
        case email
        case phone
        case image
        
    }
}
