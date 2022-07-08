//
//  FarmerView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI

struct FarmerView: View{
    
    
//    @Environment(\.presentationMode) var presentationMode
//    
    ///drop down menu values
    @State private var userSelection = "Farmer"
    let userType = ["Farmer", "Officer"]
    
    ///dorp down menu values - state
    @State private var stageSelection = "Cultivation"
    let stage = ["Cultivation", "Fertilization", "Harvesting", "Packaging"]
    
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
                    //                VStack{
                    //                    Text("User Type")
                    //                        .frame(maxWidth: .infinity, alignment: .leading)
                    //                    TextField("", value: $userType,formatter: NumberFormatter())
                    //                        .keyboardType(.numberPad)
                    //                        .textFieldStyle(.roundedBorder)
                    //                }
                    //
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
    //                    .defaultWheelPickerItemHeight(30)
                        .frame(width: 315, height: 100, alignment: .trailing)
                        .clipped()
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    VStack{
                        
//                        Text("Date")
                        DatePicker("Date", selection: $currentDate, displayedComponents: .date)
                                                    .colorInvert()
                                                    .colorMultiply(.black)
//                                                    .frame(height: UIScreen.screenHeight * 0.18, alignment: .center)
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
                        Text("Enter Food details") .font(.headline)
                    }
                }
                
        }.edgesIgnoringSafeArea([.bottom])
        }
    }
    
    
    func saveFoodDetails(){
        print(userSelection)
        print(firstName)
        print(lastName)
        print(foodName)
        print(currentDate)
        print(spec)
        print(details)
        print(certificateStatus)
        
    }
}
struct FarmerView_Previews: PreviewProvider {
    static var previews: some View {
        FarmerView()
    }
}
