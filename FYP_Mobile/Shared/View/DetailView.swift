//
//  DetailView.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//

import SwiftUI


struct DetailView: View {
    
    @EnvironmentObject var network: Network
    @State var _cultivationModel: [cultivationModel] = []
    
    var body: some View {
            List{
                ForEach( _cultivationModel, id: \.id) { item in
                    NavigationLink(destination: EventDetails(item: item)
                        .environmentObject(network)) {
                        HStack {
                            Text(item.contractName ?? "")
                                .font(.headline)
                            Text(item.date ?? "")
                        }.padding(7)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Details")
            .font(.system(size: 10))
    }
    
    
    func loadData() {
        var tmpUrl: String = "http://localhost:8080/api/contracts"
        if ( UserStatus.userSatatus.role == "officer") {
            tmpUrl += "/officer"
        } else {
            tmpUrl += "?farmerName=" + (UserStatus.userSatatus.name ?? "")
        }
        guard let url = URL(string: tmpUrl) else {
            fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest){ (data, response,error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response =  response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                guard let data  = data else { return}
                DispatchQueue.main.async {
                    do{
                        let decodeDetails = try JSONDecoder().decode([cultivationModel].self, from: data)
                        self._cultivationModel = decodeDetails
                    } catch let error {
                        print("Error decoding", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView()
        }
    }
    
//    struct details: View {
        
//        let item: cultivationModel
//        @State var events: [foodDetails] = []
//        
//        func loadEventData() {
//            let tmpUrl: String = "http://localhost:8080/api/contracts/load"
//            guard let url = URL(string: tmpUrl) else {
//                fatalError("Missing URL")}
//            let parameters: [String : Any] = ["contractId" : item.contractId,
//                                              "privateKey" : UserStatus.userSatatus.privateKey,
//                                              "gasLimit" : UserStatus.userSatatus.gasLimit,
//                                              "gasPrice" : UserStatus.userSatatus.gasPrice]
//            
//            let data = try? JSONSerialization.data(withJSONObject: parameters)
//            
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "POST"
//            urlRequest.httpBody = data
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            
//            let dataTask = URLSession.shared.dataTask(with: urlRequest){ (data, response,error) in
//                if let error = error {
//                    print("Request error: ", error)
//                    return
//                }
//                guard let response =  response as? HTTPURLResponse else {return}
//                
//                if response.statusCode == 200 {
//                    guard let data  = data else { return}
//                    DispatchQueue.main.async {
//                        do{
//                            let decodeDetails = try JSONDecoder().decode([foodDetails].self, from: data)
//                            self.events = decodeDetails
//                        } catch let error {
//                            print("Error decoding", error)
//                        }
//                    }
//                }
//            }
//            dataTask.resume()
//        }
//        
//        var body: some View {
//            
//            List{
//                if ( events.count > 0 ) {
//                    ForEach( events, id: \.eventId) { event in
//                        VStack {
//                            Text(event.date ?? "")
//                                .font(.title)
//                            Text(event.firstName ?? "")
//                                .font(.subheadline)
//                            Text(event.lastName ?? "")
//                                .font(.headline)
//                                .multilineTextAlignment(.center)
//                                .lineLimit(50)
//                        }
//                    }
//                }
//            }
//            .onAppear(perform: loadEventData)
//            .navigationBarTitle("Details")
//            .toolbar{
//                NavigationLink(destination: FarmerView(item: item, isPresenting: false)){
//                    Text("Update")
//                        .frame(width: 60, height: 10)
//                        .padding()
//                        .background(Color("theme"))
//                        .foregroundColor(Color.white)
//                        .environmentObject(network)
//                    .cornerRadius(10)
//                }
//            }
//            .font(.system(size: 10))
//        }
//    }
//    
//    func loadEventDetail(parameters : [String: Any], completion: @escaping(Bool, Int) -> ()) {
//        guard let url = URL(string: "http://localhost:8080/api/contracts/load")else {fatalError("Missing Url")}
//        
//        let data = try? JSONSerialization.data(withJSONObject: parameters)
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = data
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                completion(false, 500)
//                return
//            }
//            guard let response = response as? HTTPURLResponse else { return }
//            
//            if response.statusCode == 200 {
//                guard let data = data else {
//                    completion(false, 500)
//                    return
//                }
//                do {
//                    let decodedDetails = try JSONDecoder().decode(SignUpModel.self, from: data)
//                    print(decodedDetails)
//                    completion(false, response.statusCode)
//                } catch let error {
//                    print("Error decoding: ", error)
//                    completion(false, 500)
//                }
//            }
//        }
//        dataTask.resume()
//    }
}
