//
//  WalletView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-07-08.
//

import SwiftUI

struct WalletView: View {
    
    @State var walletAddress: String
    
    var body: some View {
        VStack{
            Form {
                VStack{
                    Text("Wallet Address")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                    TextField("Enter wallet address", value: $walletAddress,formatter: NumberFormatter())
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
                .padding(5)
                .listRowSeparator(.hidden)
                
            }
            HStack{
                Button(action: {
                    print("save")
                }, label: {
                    Text("Save")
                        .frame(width: 60, height: 10)
                        .padding()
                        .background(Color("theme"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                Spacer()
                    .frame(width: 20)
                NavigationLink(destination: HomeView()){
                    Text("Cancel")
                        .frame(width: 60, height: 10)
                        .padding()
                        .background(Color("theme"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 70, bottom: 20, trailing: 0))
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Enter Wallet Address") .font(.headline)
                }
            }
            
        }.edgesIgnoringSafeArea([.bottom])
    }
    
    func postPrivateKey(parameters : [String: Any], completion: @escaping(Bool, Int) -> ()) {
        guard let url = URL(string: "")else {fatalError("Missing Url")}
        
        let data = try? JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                completion(false, 500)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    completion(false, 500)
                    return
                }
                do {
                    let decodedDetails = try JSONDecoder().decode(SignUpModel.self, from: data)
                    print(decodedDetails)
                    completion(false, response.statusCode)
                } catch let error {
                    print("Error decoding: ", error)
                    completion(false, 500)
                }
            }
        }
        dataTask.resume()
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(walletAddress: "123qweasdsdfd")
    }
}
