//
//  FarmerView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI

struct FarmerView: View{
    
    @EnvironmentObject var network : Network 
    
    @State var item: cultivationModel;
    
    @State var userSelection: UserType = .Farmer
    // let userType = ["Farmer", "Officer"]
    
    enum UserType: Int, Equatable, CaseIterable {
        case Farmer = 0
        case Officer
        
        static var allValues: [UserType] {
            return [
                .Farmer,
                .Officer
            ]
        }
        
        var index: Int {
            return rawValue
        }
        
        var value: String {
            return String(describing: self)
        }
    }
    
    @State private var stageSelection: StageType = .Cultivation
    
    enum StageType: Int, Equatable, CaseIterable {
        case Cultivation = 0
        case Fertilization
        case Harvesting
        case Certification
        case Packaging
        
        
        static var allValues: [StageType] {
            return [
                .Cultivation,
                .Fertilization,
                .Harvesting,
                .Packaging,
                .Certification
            ]
        }
        
        var index: Int {
            return rawValue
        }
        
        var value: String {
            return String(describing: self)
        }
    }
    
//    @State var eventId : Int?
    @State var userId : Int?
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var foodName: String = ""
    @State var spec: String = ""
    @State var details: String = ""
    @State var certificateStatus: String = ""
    @State var currentDate = Date()
    
    @State var isAlert = false
    @State var isPresenting: Bool
    
    var body: some View {
        VStack{
            Form {
//                VStack{
//                    Text("Event Id")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.system(size: 15))
//                    TextField("event id", value: $eventId,formatter: NumberFormatter())
//                        .textFieldStyle(.roundedBorder)
//                        .foregroundColor(.gray)
//                        .font(.system(size: 13))
//                }
//                .padding(5)
//                .listRowSeparator(.hidden)
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
                        Text("Selected user Type: \(userSelection.value)")
                            .padding(.bottom,-20)
                            .font(.system(size: 15))
                    }
                    Picker("Select User type", selection: $userSelection) {
                        ForEach(UserType.allValues, id: \.self) { value in
                            Text(value.value)
                                .tag(value)
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
                    VStack{
                        Text("Selected Stage: \(stageSelection.value)")
                            .padding(.bottom, -30)
                            .font(.system(size: 15))
                    }
                    Picker("Select Stage", selection: $stageSelection) {
                        ForEach(StageType.allValues, id: \.self) { value in
                            Text(value.value)
                                .tag(value)
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
                Button(action: {saveFoodDetails()}, label: {
                    Text("Save")
                        .frame(width: 60, height: 10)
                        .padding()
                        .background(Color("theme"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                NavigationLink(destination: HomeView(),isActive: $isPresenting){
                    Text("")
                    
                }
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
    
    
    func saveFoodDetails(){
        
        if firstName != "" && lastName != "" && foodName != "" && currentDate != Date()  && spec != "" && details != "" && certificateStatus != ""{
            let parameters: [String : Any] = ["firstName" : firstName,
                                              "lastName" : lastName,
                                              "foodName" : foodName,
                                              "date" : convertDateToUTC(dateToConvert: currentDate),
                                              "spec" : spec,
                                              "details" : details,
                                              "userType" : userSelection.index,
                                              "stage" : stageSelection.index,
                                              "certificationStatus" : certificateStatus,
                                              "contractId": item.contractId,
                                              "privateKey": UserStatus.userSatatus.privateKey,
                                              "gasPrice": UserStatus.userSatatus.gasPrice,
                                              "gasLimit": UserStatus.userSatatus.gasLimit
            ]
            
            network.addEvent(parameters: parameters){(success, statuscode)in
                if statuscode == 200 {
                    print(parameters)
                    //                    self.isPresenting = true
                }
                else {
                    print("data adding failed")
                }
            }
        }else{
            
        }
    }
    
    func convertDateToUTC(dateToConvert: Date) -> String {
            let utcDateFormatter = DateFormatter()
            utcDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            utcDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            return utcDateFormatter.string(from: dateToConvert)
        }
}
