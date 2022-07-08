////
////  chathura.swift
////  FYP_Mobile (iOS)
////
////  Created by Randimal Geeganage on 2022-07-08.
////
//
//import SwiftUI
//import Combine
//import AlertToast
//
//struct AddSchedule: View {
//    
//    var pin = ""
//    var token = ""
//    var buttonName = ""
//    
//    @State private var triggerTime = Date()
//    @State private var isOn = true
//    @State private var isActive = true
//    //    @State private var selectedTimeZone = 0
//    @State private var days = [false,false,false,false,false,false,false]
//    @State private var dayname = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
//    @State private var isShowing = false
//    @State private var loaderText = "Saving..."
//    @State private var showingAlert = false
//    @State private var alertTitle = ""
//    @State private var message = ""
//    @State private var seconds = ""
//    @State private var showToast = false
//    //    @State private var isSaveOk = false
//    var sheduleModel = ScheduleModel()
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    //    var timeZones = ["Asia/Colombo", "USA/California", "UK/London", "China/Beijing", "USA/Texas", "Asia/Mumbai"]
//    //    var timeZones = ["Australia/Darwin","Australia/Sydney","America/Argentina/Buenos_Aires","Africa/Cairo","America/Anchorage","America/Sao_Paulo","Asia/Dhaka","Africa/Harare","America/St_Johns","America/Chicago","Asia/Shanghai","Africa/Addis_Ababa","Europe/Paris","America/Indiana/Indianapolis","Asia/Kolkata","Asia/Tokyo","Pacific/Apia","Asia/Yerevan","Pacific/Auckland","Asia/Karachi","America/Phoenix","America/Puerto_Rico","America/Los_Angeles","Pacific/Guadalcanal","Asia/Ho_Chi_Minh"]
//    
//    func createShedule() {
//        
//        if !sheduleModel.checkDaySelected(days: self.days) {
//            showToast = true
//            return
//        }
//        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: self.triggerTime)
//        let _hour = components.hour ?? 0
//        let _minute = components.minute ?? 0
//        let _seconds = Int(seconds) ?? 0
//        let utcdiff = 5 * 60 * 60 + 30 * 60
//        let _totalseconds = _hour * 60 * 60 + _minute * 60 + _seconds
//        
//        //Added only for local time zone
//        var time = _totalseconds - utcdiff
//        
//        if time <= 0 {
//            time = 24 * 3600 + time
//        }
//        
//        let shedule = SingleSchedule(pin: self.pin, timeZone: "UTC", time: time, isOn: self.isOn, days: self.days, active: self.isActive)
//        
//        //                            var keyChainSchdules = KeyChain.getSchedule()
//        var shedules = [SingleSchedule]()
//        shedules.append(shedule)
//        
//        isShowing = true
//        sheduleModel.createShedule(token: self.token, shedules: shedules) { isSuccess in
//            isShowing = false
//            if isSuccess {
//                showingAlert = true
//                alertTitle = "Successful"
//                message = "Schedule created successfully"
//            } else {
//                showingAlert = true
//                alertTitle = "Unsuccessful"
//                message = "Cannot add a schedule"
//            }
//        }
//    }
//    
//    var body: some View {
//        LoadingView(isShowing: $isShowing, loaderText: $loaderText){
//            ScrollView {
//                VStack(spacing: 20) {
//                    Group {
//                        HStack {
//                            Text("Add Scheduling Time")
//                                .font(.system(size: 17))
//                                .fontWeight(.medium)
//                                .foregroundColor(.white)
//                                .padding(.leading, 20)
//                            Spacer()
//                        }
//                        
//                        HStack {
//                            Text("Hours & Minutes")
//                                .font(.system(size: 17))
//                                .fontWeight(.medium)
//                                .foregroundColor(.white)
//                                .padding(.leading, 20)
//                            
//                            Spacer()
//                        }
//                        
//                        DatePicker("", selection: $triggerTime, displayedComponents: .hourAndMinute)
//                            .colorInvert()
//                            .colorMultiply(.white)
//                            .frame(height: UIScreen.screenHeight * 0.18, alignment: .center)
//                            .datePickerStyle(WheelDatePickerStyle())
//                            .transformEffect(.init(scaleX: 0.9, y: 0.9))
//                            .clipped()
//                        
//                        HStack {
//                            Text("Seconds ")
//                                .font(.system(size: 17))
//                                .fontWeight(.medium)
//                                .foregroundColor(.white)
//                            
//                            Spacer()
//                            
//                            TextField("0", text: $seconds)
//                                .padding()
//                                .background(Color.themeTextField)
//                                .frame( width: UIScreen.screenWidth * 0.5 - 10, height: 45)
//                                .cornerRadius(8.0)
//                                .shadow(radius: 10.0, x: 10, y: 10)
//                                .foregroundColor(/@START_MENU_TOKEN@/.blue/@END_MENU_TOKEN@/)
//                                .disableAutocorrection(true)
//                                .autocapitalization(/@START_MENU_TOKEN@/.none/@END_MENU_TOKEN@/)
//                                .keyboardType(.numberPad)
//                                .onReceive(Just(seconds)) { newValue in
//                                    guard let value = Int(newValue), 1...59 ~= value else {
//                                        self.seconds = "0"
//                                        return
//                                    }
//                                    self.seconds = String(value)
//                                    print(newValue)
//                                }
//                        }
//                        .padding([.leading,.trailing], 20)
//                    }
//                    .padding(.top, 10)
//                    
//                    //                        Text("Add Time Zone ")
//                    //                            .font(.system(size: 17))
//                    //                            .fontWeight(.regular)
//                    //                            .foregroundColor(.white)
//                    //
//                    //                        Picker(selection: $selectedTimeZone, label: Text("") ) {
//                    //                            ForEach(0 ..< timeZones.count) {
//                    //                                Text(self.timeZones[$0])
//                    //                                    .font(.system(size: 17))
//                    //                                    .fontWeight(.medium)
//                    //                                    .foregroundColor(.white)
//                    //                            }
//                    //                        }
//                    //                        .labelsHidden()
//                    //                        .frame(height: 120, alignment: /@START_MENU_TOKEN@/.center/@END_MENU_TOKEN@/)
//                    //                        .clipped()
//                    
//                    Divider()
//                        .frame(width: UIScreen.screenWidth - 20, alignment: /@START_MENU_TOKEN@/.center/@END_MENU_TOKEN@/)
//                        .background(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//                    
//                    HStack {
//                        ForEach(0...6, id: \.self) { index in
//                            Button(action: {
//                                self.days[index] = !self.days[index]
//                            }) {
//                                Text(dayname[index])
//                                    .fontWeight(.bold)
//                                    .font(.system(size: 20))
//                                    .frame(width: UIScreen.screenWidth * 0.1, height: UIScreen.screenWidth * 0.1)
//                                    .background( days[index] ? Color.init(#colorLiteral(red: 0, green: 0.5545940995, blue: 0.776235342, alpha: 1)) : Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
//                                    .foregroundColor(.white).font(.system(size: 12)) }
//                        }
//                    }
//                    
//                    Divider()
//                        .frame(width: UIScreen.screenWidth - 20, alignment: /@START_MENU_TOKEN@/.center/@END_MENU_TOKEN@/)
//                        .background(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//                    
//                    Toggle(isOn: $isOn) {
//                        Text("On / Off ")
//                            .font(.system(size: 17))
//                            .fontWeight(.medium)
//                            .foregroundColor(.white)
//                    }
//                    .padding([.trailing,.leading], 20)
//                    
//                    Divider()
//                        .frame(width: UIScreen.screenWidth - 20, alignment: /@START_MENU_TOKEN@/.center/@END_MENU_TOKEN@/)
//                        .background(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//                    
//                    Toggle(isOn: $isActive) {
//                        Text("Shedule active / inactive")
//                            .font(.system(size: 17))
//                            .fontWeight(.medium)
//                            .foregroundColor(.white)
//                    }
//                    .padding([.trailing,.leading], 20)
//                    
//                    Divider()
//                        .frame(width: UIScreen.screenWidth - 20, alignment: /@START_MENU_TOKEN@/.center/@END_MENU_TOKEN@/)
//                        .background(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//                    
//                    //                NavigationLink(destination: ScheduleView(self.pin,self.token,self.buttonName), isActive: $isSaveOk) {
//                    //                     EmptyView()
//                    //                }
//                    
//                    Button(action: createShedule) {
//                        Text("Save")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(width: UIScreen.screenWidth - 75, height: 45)
//                            .background(Color.init(#colorLiteral(red: 0, green: 0.5545940995, blue: 0.776235342, alpha: 1)))
//                            .cornerRadius(15.0)
//                            .shadow(radius: 10.0, x: 20, y: 10)
//                        
//                    }.padding()
//                    
//                }
//                .background(Color.init(#colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1)))
//                .cornerRadius(10)
//                .padding([.leading, .trailing], 10)
//                .padding(.top, 15)
//            }
//            .background(Color.init(#colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1803921569, alpha: 1)))
//            .toast(isPresenting: $showToast){
//                
//                // `.alert` is the default displayMode
//                AlertToast(displayMode:.banner(.pop),type: .regular, subTitle: "Please select atleast one day to create a schedule", custom: .custom(backgroundColor: Color.init(#colorLiteral(red: 0.7647058824, green: 0.05490196078, blue: 0.05490196078, alpha: 1)), titleColor: Color.init(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), subTitleColor: Color.init(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))))
//                
//                //Choose .hud to toast alert from the top of the screen
//                //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
//                
//                //Choose .banner to slide/pop alert from the bottom of the screen
//                //AlertToast(displayMode: .banner(.slide), type: .regular, title: "Message Sent!")
//            }
//        }
//        .background(Color.init(#colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1803921569, alpha: 1)))
//        .navigationBarTitle(Text("Add Schedule to \(self.buttonName)"), displayMode: .inline)
//        .alert(isPresented: $showingAlert) {
//            Alert(
//                title: Text(alertTitle),
//                message: Text(message),
//                dismissButton: .default(Text("OK")) {
//                    showingAlert = false
//                    if alertTitle == "Successful" {
//                        DispatchQueue.main.async {
//                            self.mode.wrappedValue.dismiss()
//                        }
//                    }
//                }
//            )
//        }
//    }
//}
//
//
//struct AddSchedule_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSchedule()
//    }
//}
