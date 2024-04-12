//
//  DetailView.swift
//  ChallengeJSONHWS
//
//  Created by Baymurat Abdumuratov on 11/04/24.
//

import SwiftUI

struct DetailView: View {
    
    var user: User
    
    var body: some View {
        List{
            HStack{
                VStack{
                    Text(user.name)
                        .font(.title)
                    Text("Age: \(user.age)")
                    
                    Text("Company: \(user.company)")
                    
                }
                Spacer()
                Image("default")
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(user.isActive ? Color.green : Color.gray)
                            
                    }
                
                
                
            }
            .padding()
            Text("About: \(user.about)")
                .padding()
            
            Text("Friends")
                .font(.title)
            ForEach(user.friends, id: \.id){friend in
                Text(friend.name)
                

                
            }
        }
       
    
    }
}

#Preview {
  DetailView(user: User(id: "", isActive: true, name: "", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: ["", ""], friends: [Friend(id: "", name: "")]))
}
