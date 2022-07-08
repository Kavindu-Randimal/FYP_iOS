//
//  Network.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//

import Foundation
import SwiftUI
import Combine

class Network: ObservableObject {
//    @Published var details: [foodDetails] = []
//    @Published var user = [SignUpModel] ()
    
//    func getDetails(){
//        guard let url = URL(string: "http://localhost:8080/api/accounts")else { fatalError("Missing URL") }
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedDetails = try JSONDecoder().decode([foodDetails].self, from: data)
//                        self.details = decodedDetails
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
    
    //    MARK: - POST Data
    
    ///send the event details trough API to smart contract
    
    func sendDetails(){
        guard let url = URL(string: "http://localhost:8080/api/start") else {fatalError("Missing Url")}
        let body : [String: Any] = ["privateKey":"d1a98c4bbbc626dfad6248d0324d468a05d7cfbd3717de76b4e1411536d74d23",
                                    "gasPrice":2000,
                                    "gasLimit":6721975]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedDetails = try JSONDecoder().decode(TransactionReceipt.self, from: data)
                        //                        self.start = decodedDetails
                        print(decodedDetails)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //  MARK: - POST Event
    
    func postEvent(){
        guard let url = URL(string: "http://localhost:8080/api/start") else {fatalError("Missing Url")}
        let body : [String: Any] = ["privateKey":"d1a98c4bbbc626dfad6248d0324d468a05d7cfbd3717de76b4e1411536d74d23",
                                    "gasPrice":2000,
                                    "gasLimit":6721975]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedDetails = try JSONDecoder().decode(TransactionReceipt.self, from: data)
                        //                        self.start = decodedDetails
                        
                        print(decodedDetails)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    //  MARK: - POST signup Data
    
    func signUpUser(parameters : [String: Any], completion: @escaping(SignUpModel?, Int) -> ()) {
        guard let url = URL(string: "http://localhost:8080/login/register")else {fatalError("Missing Url")}
        
        let data = try? JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                completion(nil, 500)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    completion(nil, 500)
                    return
                }
                do {
                    let decodedDetails = try JSONDecoder().decode(SignUpModel.self, from: data)
                    print(decodedDetails)
                    completion(decodedDetails, response.statusCode)
                } catch let error {
                    print("Error decoding: ", error)
                    completion(nil, 500)
                }
            }
        }
        dataTask.resume()
    }
    
    
    
    
    //  MARK: - POST login Data
    
    func loginUser(parameters : [String: Any], completion: @escaping(Bool, Int) -> ()) {
        guard let url = URL(string: "http://localhost:8080/login/login")else {fatalError("Missing Url")}
        
        let data = try? JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                completion(false, 500)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    completion(false, 500)
                    return
                }
                
                completion(true, response.statusCode)
//                do {
//                    let decodedDetails = try JSONDecoder().decode(SignUpModel.self, from: data)
//                    print(decodedDetails)
//                    completion(true, response.statusCode)
//                } catch let error {
//                    print("Error decoding: ", error)
//                    completion(false, 500)
//                }
            }
        }
        dataTask.resume()
    }
    
}


