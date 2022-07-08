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
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(walletAddress: "123qweasdsdfd")
    }
}
