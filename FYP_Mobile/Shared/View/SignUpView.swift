//
//  SignUpView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-29.
//

import SwiftUI
import Firebase

struct SignUpView: View {
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
                    Text("User Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter Username", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(10)
                .listRowSeparator(.hidden)
                VStack{
                    Text("Password ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(10)
                .listRowSeparator(.hidden)
                
//                VStack{
//                    Text("Re-enter Password ")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    TextField("Re-Enter Password", text: $password)
//                        .textFieldStyle(.roundedBorder)
//                }
//                .padding(10)
//                .listRowSeparator(.hidden)
                VStack{
                    Button(action: {
                        createNewAccount()
                        print("SignUp")
                    }, label: {
                        Text("SignUp")
                            .frame(width: 60, height: 5)
                            .padding()
                            .background(Color("theme"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }
                .padding(EdgeInsets(top: 10, leading: 110, bottom: 0, trailing: 0))
                Text("Already have an account? Login")
                
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 10))
                    .foregroundColor(.green)
            }
        }
        
    }
    private func createNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, err in
            if let err = err{
                print("failed to create account ", err)
                return
            }
           
            print("successfully created user: \(result?.user.uid ?? "")")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
