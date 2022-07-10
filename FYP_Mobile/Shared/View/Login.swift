//
//  Login.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-07-06.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var network : Network
    
    @State var isPresenting: Bool
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isAlert = false
    
    var body: some View {
        VStack{
            Form {
                VStack{Text("AgrO")
                        .foregroundColor(Color("theme"))
                        .font(.system(size: 40))
                        .padding(.leading,100)
                    Spacer()
                        .listRowSeparator(.hidden)
                    .frame(height: 0)}
                Text("Login to AgrO")
                    .padding(.leading,90)
                VStack{
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                }
                .padding(10)
                .listRowSeparator(.hidden)
                
                VStack{
                    Text("Password ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                }
                .padding(10)
                .listRowSeparator(.hidden)
                
                .listRowSeparator(.hidden)
                
                VStack{
                    Button(action: {
                        if  email != "" && password != ""  {
                            let parameters : [String: Any] = ["userEmail" : email,
                                                            "password" : password,
                            ]
                            
                            network.loginUser(parameters: parameters) { (success, statuscode) in
                                if statuscode == 200 {
                                    // redirect to login page
                                    self.isPresenting = true
                                    UserStatus.userSatatus.role = success?.userRole
                                    UserStatus.userSatatus.name = success?.userName
                                    UserStatus.userSatatus.privateKey = success?.privateKey
                                    print("user authenticated successfully")
                                } else {
                                    // login not successful
                                }
                            }
                        }else{
                            isAlert.toggle()
                        }
                        
                    }, label: {
                        Text("Login")
                            .frame(width: 60, height: 5)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                    NavigationLink(destination: HomeView().environmentObject(network),isActive: $isPresenting){
                        Text("")
                        
                    }
                    .listRowSeparator(.hidden)
                }
                NavigationLink(destination: SignUp(isPresenting: false)){
                    Text("dont have an account? signup")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("theme"))
                        .font(.system(size: 15))
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        .alert(isPresented: $isAlert, content: {
            let title = Text("Text Fields Are empty")
            let message = Text("Please fill the data before submitting")
            return Alert(title: title, message: message)
        })
       
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(isPresenting: false)
    }
}
