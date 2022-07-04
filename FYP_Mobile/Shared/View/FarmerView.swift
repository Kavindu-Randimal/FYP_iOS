//
//  FarmerView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI

struct FarmerView: View{
    
    
    @Environment(\.presentationMode) var presentationMode
    
    //drop down menu values
    @State private var userSelection = "Farmer"
    let userType = ["Farmer", "Officer"]
    
    //dorp down menu values - state
    @State private var stageSelection = "Cultivation"
    let stage = ["Cultivation", "Fertilization", "Harvesting", "Packaging"]
    
    @EnvironmentObject var network : Network
    
    //model
    @State var eventId : Int?
    @State var userId : Int?
    @State var firstName: String = ""
    @State var lastName: String = ""
    //    @State var userType: Int?
    @State var foodName: String = ""
    //    @State var stage : Int?
    @State var date : String = ""
    @State var spec: String = ""
    @State var details: String = ""
    @State var certificateStatus: String = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("AgrO")
                    .foregroundColor(Color("theme"))
                    .font(.system(size: 40))
                    .padding(.top,40)
                Spacer()
                    .frame(height: 20)
                Text("Enter Food details")
                
                Form {
                    VStack{
                        Text("Event Id")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Farmer name", value: $eventId,formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("First Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("First name", text: $firstName)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Last Name ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("last name", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    //                VStack{
                    //                    Text("User Type")
                    //                        .frame(maxWidth: .infinity, alignment: .leading)
                    //                    TextField("", value: $userType,formatter: NumberFormatter())
                    //                        .keyboardType(.numberPad)
                    //                        .textFieldStyle(.roundedBorder)
                    //                }
                    //
                    VStack {
                        Picker("Select User type", selection: $userSelection) {
                            ForEach(userType, id: \.self) {
                                Text($0)
                                
                            }
                        }
                        .foregroundColor(.white)
                        .pickerStyle(.menu)
                        
                        Text("Selected user Type: \(userSelection)")
                    }
                    
                    .padding()
                    .listRowSeparator(.hidden)
                    
                    VStack{
                        Text("Food Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Food Name", text: $foodName)
                            .keyboardType(.numberPad)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    //                VStack{
                    //                    Text("Stage")
                    //                        .frame(maxWidth: .infinity, alignment: .leading)
                    //                    TextField("", value: $stage,formatter: NumberFormatter())
                    //                        .keyboardType(.numberPad)
                    //                        .textFieldStyle(.roundedBorder)
                    //                }
                    //                .padding()
                    //                .listRowSeparator(.hidden)
                    
                    VStack {
                        Picker("Select Stage", selection: $stageSelection) {
                            ForEach(stage, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        Text("Selected Stage: \(stageSelection)")
                    }
                    
                    
                    VStack{
                        Text("Date")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Date", text: $date)
                            .keyboardType(.numberPad)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    
                    VStack{
                        Text("Spec")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("enter specification", text: $spec)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Details")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $details)
                            .border(Color.gray, width: 0.2)
                            .frame(height: 100)
                        
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Certification Status")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $certificateStatus)
                            .border(Color.gray, width: 0.2)
                            .frame(height: 100)
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                }
                
                .padding()
                .listRowSeparator(.hidden)
                Spacer()
                HStack{
                    Button(action: {
                        //                        network.sendDetails()
                    }, label: {
                        Text("Save")
                            .frame(width: 60, height: 20)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                    Spacer()
                        .frame(width: 20)
                    Button(action: {
//                        network.sendDetails()
                    }, label: {
                        Text("Cancel")
                            .frame(width: 60, height: 20)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }
                .padding(EdgeInsets(top: 0, leading: 70, bottom: 20, trailing: 0))
                
            }.ignoresSafeArea()
        }
    }
}

struct FarmerView_Previews: PreviewProvider {
    static var previews: some View {
        FarmerView(eventId: 0,userId:0)
    }
}
