//
//  DetailView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//

import SwiftUI


struct DetailView: View {
    
    @State var _cultivationModel: [cultivationModel] = []
    
    var body: some View {
            List{
                ForEach( _cultivationModel, id: \.id) { item in
                    NavigationLink(destination: details(item: item)) {
                        HStack {
                            Text(item.contractName ?? "")
                                .font(.headline)
                            Text(item.date ?? "")
                        }.padding(7)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Food Detail")
    }
    
    func loadData() {
        var tmpUrl: String = "http://localhost:8080/api/contracts"
        if ( UserStatus.userSatatus.role == "officer") {
            tmpUrl += "/officer"
        } else {
            tmpUrl += "?farmerName=" + (UserStatus.userSatatus.name ?? "")
        }
        guard let url = URL(string: tmpUrl) else {
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
                        let decodeDetails = try JSONDecoder().decode([cultivationModel].self, from: data)
                        self._cultivationModel = decodeDetails
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
        
        let item: cultivationModel
        
        var body: some View {
            
            VStack {
                Text(item.contractName ?? "")
                    .font(.title)
                Text(item.date ?? "")
                    .font(.subheadline)
                Divider()
                Text(item.farmerName ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(50)
            }.padding()
            
            NavigationLink(destination: FarmerView( item: item )){
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
