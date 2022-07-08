//
//  DetailView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//

import SwiftUI


struct DetailView: View {
    
    @State var users = [User]()
    
    var body: some View {
            List{
                ForEach(users, id: \.id) { item in
                    NavigationLink(destination: details(item: item)) {
                        HStack {
                            Text(item.name)
                                .font(.headline)
                            Text(item.email)
                        }.padding(7)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Food Detail")
    }
    
    func loadData() {
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/1y7yqdefyayegzo/employeelist.json?dl=0") else {
            fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest){ (data, response,error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response =  response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                guard let data  = data else { return}
                DispatchQueue.main.async {
                    do{
                        let decodeDetails = try JSONDecoder().decode([User].self, from: data)
                        self.users = decodeDetails
                    } catch let error {
                        print("Error decoding", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView()
        }
    }
    
    struct details: View {
        
        let item: User
        
        var body: some View {
            
            VStack {
                Text(item.name)
                    .font(.title)
                Text(item.email)
                    .font(.subheadline)
                Divider()
                Text(item.about)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(50)
            }.padding()
            
            NavigationLink(destination: FarmerView()){
                Text("Update")
                    .frame(width: 60, height: 10)
                    .padding()
                    .background(Color("theme"))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
