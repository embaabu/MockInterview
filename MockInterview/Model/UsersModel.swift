//
//  UsersModel.swift
//  MockInterview
//
//  Created by Edwin Mbaabu on 11/27/24.
//



struct UsersModel: Decodable, Identifiable{
    var id: Int
    var name : String
    var username : String
    var email: String
//    var address : Address
    var phone : String
    var website : String
//    var company : Company
    
    
}
struct Address: Decodable{
    
}
struct Company : Decodable{
    
}
/*

 id
 :
 1
 name
 :
 "Leanne Graham"
 username
 :
 "Bret"
 email
 :
 "Sincere@april.biz"
 address
 {5}
 phone
 :
 "1-770-736-8031 x56442"
 website
 :
 "hildegard.org"
 company
 {3}
 */
