//
//  DetailView.swift
//  ChallengeJSONHWS
//
//  Created by Baymurat Abdumuratov on 11/04/24.
//

import SwiftUI

struct DetailView: View {
    
    var user: User
    @State var isViewed = false
    
    var body: some View {
       
        NavigationStack {
            List{
                HStack{
                    VStack(alignment: .leading){

                        Text("Age: \(user.age)")
                        
                        Text("Company: \(user.company)")
                        
                        
                        Text("Address: \(user.address)")
                        
                        Text("Email: \(user.email)")

                        
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
                
                Section(header: Text("About")) {
                    VStack(alignment:.leading){
                        Text(user.about)
                            .lineLimit(isViewed ? .max : 2)
                        
                        Button(action: {
                            isViewed.toggle()
                        }, label: {
                            Text(isViewed ? "Read less" : "Read more")
                                .bold()
                        })
                    }
                }

                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(user.tags, id: \.self){ tag in
                            Capsule()
                                .fill(.red)
                                .frame(width: getWidthForText(tag: tag), height: 30)
                                .overlay {
                                    Text(tag)
                                        .foregroundColor(.white)
                                        
                                }
                                
                        }
                    }
                    
                }
                Section(header: Text("Friends") .font(.title)) {
                   
                       
                    ForEach(user.friends, id: \.id){friend in
                        Text(friend.name)
                        

                        
                    }
                }
            }
            .navigationTitle("\(user.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
       
    
    }
    
    func getWidthForText(tag: String) -> CGFloat{ //This changes the width dynamically
        let font = UIFont.systemFont(ofSize: 17)
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (tag as NSString).size(withAttributes: fontAttributes)
        return size.width + 20
        
    }
}

#Preview {
  DetailView(user: User(id: "", isActive: true, name: "", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: ["", ""], friends: [Friend(id: "", name: "")]))
}
