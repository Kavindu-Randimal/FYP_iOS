//
//  SignUp.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-07-06.
//

import SwiftUI

struct SignUp: View {
    
    @EnvironmentObject var network : Network
    
    @State var isPresenting: Bool
    
    @State var userName: String = ""
    @State var email: String = ""
    @State var role: String = ""
    @State var password: String = ""
    @State var isAlert = false
    
    var body: some View {
//        VStack{
//            NavigationView{
                Form {
                    Text("AgrO")
                        .foregroundColor(Color("theme"))
                        .font(.system(size: 40))
                        .frame(height:80, alignment: .center)
                        .padding(.leading,110)
                        
                    VStack{
                        Text("User Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter Username", text: $userName)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(10)
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Emal ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter Email", text: $email)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(10)
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Password ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        SecureField("Enter Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(10)
                    .listRowSeparator(.hidden)
                    VStack{
                        Text("Role ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("farmer or Officer", text: $role)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(10)
                    .listRowSeparator(.hidden)
                    alert(isPresented: $isAlert, content: {
                        let title = Text("No message")
                        let message = Text("Please fill the data before submitting")
                        return Alert(title: title, message: message)
                    })
                    .listRowSeparator(.hidden)
                    VStack{
                        Button(action: {
                            if userName != "" && email != "" && password != "" && role != ""  {
                                let parameters : [String: Any] = ["userName" : userName, "userEmail" : email, "password" : password, "userRole" : role]
                                
                                network.signUpUser(parameters: parameters) { (success, statuscode) in
                                    if statuscode == 200 {
                                        // redirect to login page
                                        self.isPresenting = true
                                        print("user authenticated successfully",success)
                                    } else {
                                        // login not successful
                                    }
                                }
                            }else{
                                isAlert.toggle()
                            }
                        }, label: {
                            Text("SignUp")
                                .frame(width: 60, height: 5)
                                .padding()
                                .background(Color("theme"))
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                                .padding(.leading, 120)
                        })
                    }
                    NavigationLink(destination: Login(isPresenting: false)){
                        Text("Already have an account? Login")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color("theme"))
                            .font(.system(size: 15))
                            .padding(.leading,34)
//                            .navigationBarBackButtonHidden(true)
                    }
                }
//                .padding(-10)
//            }
//        }
    }
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(isPresenting: false)
    }
}

