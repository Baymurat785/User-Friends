//
//  ContentView.swift
//  ChallengeJSONHWS
//
//  Created by Baymurat Abdumuratov on 11/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    @State private var userActive = ""
    
    var body: some View {
        
        NavigationStack{
            List(users, id: \.id){user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    
                    Text(user.name)
                        .font(.title3)
                    Spacer()
                    Text(user.isActive ? "Active" : "Inactive")
                        .font(.headline)
                    
                }

               
                
                
            }
            
        }
        
        .task {
            await loadData()
        }
    }
    
    
    func loadData() async  {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else{
            print("Invalid URL")
            return
        }
        // fetchign the data
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //The second underscore for metadata
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data){
                users = decodedResponse
            }
        }catch{
            print("Invalid data")
        }
        
    }
}

#Preview {
    ContentView()
}
