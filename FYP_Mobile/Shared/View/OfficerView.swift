////
////  OfficerView.swift
////  FYP_Mobile (iOS)
////
////  Created by Randimal Geeganage on 2022-06-29.
////
//
//import SwiftUI
//
//struct OfficerView: View {
//    @State var firstName: String = ""
//    @State private var certificationDate = Date()
//    @State var status: String = ""
//    @State var date: String = ""
//    
//    
//    var body: some View {
//        VStack{
//            Text("AgrO")
//                .foregroundColor(Color("theme"))
//                .font(.system(size: 40))
//            Spacer()
//                .frame(height: 50)
//            Text("Certificate")
//            
//           
//            Form {
//                List{
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                }
//                
//                VStack{
//                    Text("First Name")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    TextField("officer name", text: $firstName)
//                        .textFieldStyle(.roundedBorder)
//                }
//                .padding()
//                .listRowSeparator(.hidden)
//                
//                VStack{
//                    Text("Date")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    TextField("20-12-30", text: $date)
//                        .textFieldStyle(.roundedBorder)
//                }
//                .padding()
//                .listRowSeparator(.hidden)
//                
////                VStack{
////                    DatePicker(selection: $certificationDate, in: ...Date(), displayedComponents: .date) {
////                        Text("Select certified date")
////                    }
////                }
////                .padding()
//                
//                VStack{
//                    Text("Certification Status")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    TextEditor(text: $status)
//                        .border(Color.gray, width: 0.2)
//                        .frame(height: 100)
//                }
//                .padding()
//                Spacer()
//                
//                HStack{
//                    Button(action: {
//                        print("Save")
//                    }, label: {
//                        Text("Save")
//                            .frame(width: 60, height: 20)
//                            .padding()
//                            .background(Color("theme"))
//                            .foregroundColor(Color.white)
//                            .cornerRadius(10)
//                    })
//                    Spacer()
//                        .frame(width: 20)
//                    Button(action: {
//                        print("Cancel")
//                    }, label: {
//                        Text("Cancel")
//                            .frame(width: 60, height: 20)
//                            .padding()
//                            .background(Color("theme"))
//                            .foregroundColor(Color.white)
//                            .cornerRadius(10)
//                    })
//                }
//                .padding(EdgeInsets(top: 0, leading: 70, bottom: 20, trailing: 0))
//                .listRowSeparator(.hidden)
//            }
//        }
//        
//    }
//}
//
//struct OfficerView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfficerView()
//    }
//}
