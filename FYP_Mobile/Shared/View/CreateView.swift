//
//  CreateView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-07-09.
//

import SwiftUI

struct CreateView: View {
    
    @EnvironmentObject var network : Network
    
    @State var cultivationName : String
    @State var cultivationDate = Date()
    
    var body: some View {
        NavigationView {
            Form{
                VStack{
                    Text("Cultivation Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Cultivation Name", text: $cultivationName)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                .listRowSeparator(.hidden)
                
                VStack{
                    Text("Cultivation Date")
                        .frame(alignment: .leading)
                        .padding(.leading,-168)
                    Spacer()
                    DatePicker("Date", selection: $cultivationDate, displayedComponents: .date)
                        .colorInvert()
                        .colorMultiply(.black)
                        .datePickerStyle(WheelDatePickerStyle())
                        .transformEffect(.init(scaleX: 0.7, y: 0.8))
                        .clipped()
                        .padding(.leading,16)
                }
                .padding()
                .listRowSeparator(.hidden)
                
                Button(action: saveContractDetails, label: {
                    Text("Create")
                        .frame(width: 80, height: 40)
                        .background(Color("theme"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .padding(.leading,110)
                })
                Spacer()
                    .frame(width: 20, alignment: .trailing)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Agro")
                            .foregroundColor(Color("theme"))
                            .font(.system(size: 40))
                        Spacer()
                        Text("New Cultivation")
                    }
                }
            }
        }
    }
    
    func saveContractDetails(){
        let dateFormatter = DateFormatter()
        
        if cultivationName != "" {
            let parameters : [String : Any] = [ "contractName" : cultivationName,
                                                "date" : dateFormatter.string(from: cultivationDate),
                                                "privateKey" : UserStatus.userSatatus.privateKey,
                                                "gasPrice": UserStatus.userSatatus.gasPrice,
                                                "gasLimit": UserStatus.userSatatus.gasLimit,
                                                "farmerName": UserStatus.userSatatus.name]
            
            network.createContract(parameters: parameters){(success, statuscode) in
                if statuscode == 200 {
                    print(parameters)
                }
                else {
                    print("create contract is failed")
                }
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(cultivationName: "")
    }
}
