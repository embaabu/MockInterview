//
//  ContentView.swift
//  MockInterview
//
//  Created by Edwin Mbaabu on 11/27/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UsersViewModel(networkManager: NetworkMnager())
//    var user: UsersModel
    var body: some View {
        NavigationStack{
            VStack {
                if viewModel.responseError != nil{
                    Text("Error \(viewModel.responseError!.localizedDescription)")
                }else{
                    List(viewModel.userData) {user in
                        ProfileCell(user: user)
                        
                    }
                }
            }
        }
        .task {
            await viewModel.getUserProfile()
        
    }
        .padding()
    }
}

#Preview {
    ContentView()
}
