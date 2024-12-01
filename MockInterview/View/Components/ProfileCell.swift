//
//  ProfileCell.swift
//  MockInterview
//
//  Created by Edwin Mbaabu on 11/30/24.
//

import SwiftUI

struct ProfileCell: View {
    var user: UsersModel
    var body: some View {
        VStack{
            Text("Name - \(user.name)")
            Text("Email - \(user.email)")
            Text("UserName - \(user.username)")
        }
    }
}

#Preview {
    ProfileCell(user: UsersModel(id: 1, name: "Mbaabu", username: "Kato", email: "Mbaabugitonga@gmail.com" , phone: "12423453254234", website: "MBAABUGITONGA.COM"))
}
