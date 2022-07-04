//
//  LoginView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""

    init(){
        FirebaseApp.configure()
    }
    
    var body: some View {
        VStack{
            Text("AgrO")
                .foregroundColor(Color.green)
                .font(.system(size: 40))
            Spacer()
                .frame(height: 50)
            
            Form {
                VStack{
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Email", text: $email)
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
                    Button(action: {
                        loginUser()
                    }, label: {
                        Text("login")
                            .frame(width: 60, height: 5)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }
                .padding(EdgeInsets(top: 10, leading: 130, bottom: 0, trailing: 0))
                Text("dont have an account? Signup")
                
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 10))
                    .foregroundColor(.green)
            }
        }
        
    }
    
    private func loginUser(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, err in
            if let err = err{
                print("failed to login account ", err)
                return
            }
            print("successfully login user: \(result?.user.uid ?? "")")
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
