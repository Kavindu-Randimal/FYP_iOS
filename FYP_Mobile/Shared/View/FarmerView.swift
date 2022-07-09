//
//  FarmerView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI

struct FarmerView: View{
    @State var item: cultivationModel;
    
    //    @Environment(\.presentationMode) var presentationMode
    //
    ///drop down menu values
    @State private var userSelection = "Farmer"
    let userType = ["Farmer", "Officer"]
    
    ///dorp down menu values - state
    @State private var stageSelection = "Cultivation"
    let stage = ["Cultivation", "Fertilization", "Harvesting", "Packaging", "Certification"]
    
    @EnvironmentObject var network : Network
    
    ///model
    @State var eventId : Int?
    @State var userId : Int?
    @State var firstName: String = ""
    @State var lastName: String = ""
    //    @State var userType: Int?
    @State var foodName: String = ""
    //    @State var stage : Int?
    //    @State var date : String = ""
    @State var spec: String = ""
    @State var details: String = ""
    @State var certificateStatus: String = ""
    @State var currentDate = Date()
    
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    VStack{
                        Text("Event Id")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextField("event id", value: $eventId,formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("First Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextField("first name", text: $firstName)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 13))
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Last Name ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextField("last name", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 13))
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                    VStack {
                        VStack{
                            Text("Selected user Type: \(userSelection)")
                                .padding(.bottom,-20)
                                .font(.system(size: 15))
                        }
                        Picker("Select User type", selection: $userSelection) {
                            ForEach(userType, id: \.self) {
                                Text($0)
                                    .font(.system(size: 12))
                                
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 320, height: 100, alignment: .trailing)
                    }
                    .listRowSeparator(.hidden)
                    
                    VStack{
                        Text("Food Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextField("food Name", text: $foodName)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 13))
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                    VStack {
                        
                        Text("Selected Stage: \(stageSelection)")
                            .padding(.bottom, -30)
                            .font(.system(size: 15))
                        
                        
                        Picker("Select Stage", selection: $stageSelection) {
                            ForEach(stage, id: \.self) {
                                Text($0)
                                    .font(.system(size: 12))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 315, height: 100, alignment: .trailing)
                        .clipped()
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    VStack{
                        DatePicker("Date", selection: $currentDate, displayedComponents: .date)
                                                    .colorInvert()
                                                    .colorMultiply(.black)
                                                    .datePickerStyle(WheelDatePickerStyle())
                                                    .transformEffect(.init(scaleX: 0.9, y: 0.9))
                                                    .clipped()
//
//                        Text("Date")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .font(.system(size: 15))
//                        TextField("date", text: $date)
//                            .keyboardType(.numberPad)
//                            .textFieldStyle(.roundedBorder)
//                            .font(.system(size: 13))
                    }
                    .padding(10)
                    .listRowSeparator(.hidden)
//                    
                    VStack{
                        Text("Spec")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextField("enter specification", text: $spec)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 13))
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Details")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextEditor(text: $details)
                            .border(Color.gray, width: 0.2)
                            .frame(height: 100)
                            .font(.system(size: 13))
                        
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                    
                    VStack{
                        Text("Certification Status")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                        TextEditor(text: $certificateStatus)
                            .border(Color.gray, width: 0.2)
                            .frame(height: 100)
                            .font(.system(size: 13))
                    }
                    .padding(5)
                    .listRowSeparator(.hidden)
                }
                HStack{
                    Button(action: saveFoodDetails, label: {
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
                        Text("Agro")
                            .foregroundColor(Color("theme"))
                            .font(.system(size: 40))
                        Spacer()
                        Text("Enter Food details") .font(.headline)
                    }
                }
            }.edgesIgnoringSafeArea([.bottom])
        }
    }
    
    
    func saveFoodDetails(){
        let dateFormatter = DateFormatter()

        if firstName != "" && lastName != "" && foodName != "" && currentDate != Date()  && spec != "" && details != "" && certificateStatus != ""{
            let parameters: [String : Any] = ["firstName" : firstName,
                                              "lastName" : lastName,
                                              "foodName" : foodName,
                                              "date" : dateFormatter.string(from: currentDate),
                                              "spec" : spec,
                                              "details" : details,
                                              "userType" : 0,
                                              "stage" : 1,
                                              "certificationStatus" : certificateStatus,
                                              "contractId": item.contractId,
                                              "privateKey": UserStatus.userSatatus.privateKey,
                                              "gasPrice": UserStatus.userSatatus.gasPrice,
                                              "gasLimit": UserStatus.userSatatus.gasLimit
            ]
            
            network.addEvent(parameters: parameters){(success, statuscode)in
                if statuscode == 200 {
                    print(parameters)
                }
                else {
                    print("data adding failed")
                }
            }
        }
        else{
           
        }
    }
}
//struct FarmerView_Previews: PreviewProvider {
//    static var previews: some View {
//        FarmerView()
//    }
//}
