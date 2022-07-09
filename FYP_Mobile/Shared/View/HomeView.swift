//
//  HomeView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI

struct HomeView: View {
    
    
    @EnvironmentObject var network : Network
    
    var body: some View {
        NavigationView{
            VStack{
                Text("AgrO")
                    .foregroundColor(Color("theme"))
                    .font(.system(size: 70))
                Spacer()
                    .frame(height: 100)
                Image("agropng")
                    .resizable()
                    .frame(width: 200, height: 200)
                Spacer()
                    .frame(height: 100)
                VStack{
                    NavigationLink(destination: CreateView(cultivationName: "")){
                        Text("+ Create")
                            .frame(width: 170, height: 20)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: DetailView()){
                        Text("View Details")
                            .frame(width: 170, height: 20)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: QRScanner()){
                        Text("Scan QR")
                            .frame(width: 170, height: 20)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.top, -150)
        }
//        .padding(.top, -150)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
