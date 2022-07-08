////
////  postDetails.swift
////  FYP_Mobile (iOS)
////
////  Created by Randimal Geeganage on 2022-06-30.
////
//
//import Foundation
//import SwiftUI
//import Combine
//
//class HttpAuth: ObservableObject {
//
//    @Published var authenticated = false
//
//    func postAuth(eventId : Int, userId : Int, firstName: String, lastName: String,userType: Int, foodName: String, stage : Int, date : String ,spec: String, details: String,certificateStatus: String) {
//        guard let url = URL(string: "http://mysite/loginswift.php") else { return }
//
//        let body: [String: String] = ["username": username, "password": password]
//
//        let finalBody = try! JSONSerialization.data(withJSONObject: body)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalBody
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data else { return }
//            let resData = try! JSONDecoder().decode(ServerMessage.self, from: data)
//            print(resData.res)
//            if resData.res == "correct" {
//                DispatchQueue.main.async {
//                    self.authenticated = true
//                }
//            }
//        }.resume()
//    }
//}
//


