//
//  QRScanner.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//
import SwiftUI
import CodeScanner

struct QRScanner: View {
    @EnvironmentObject var network: Network
    @State var isPresentingScanner = false
    @State var isPresenting: Bool = false
    @State var scannedCode: String = "Scan a QR code to get started"
    @State var events: [foodDetails] = []
    
//    func loadEventData(code: String) {
//        let tmpUrl: String = "http://localhost:8080/api/contracts/load"
//        guard let url = URL(string: tmpUrl) else {
//            fatalError("Missing URL")}
//        let parameters: [String : Any] = ["contractId" : scannedCode,
//                                          "privateKey" : UserStatus.userSatatus.privateKey,
//                                          "gasLimit" : UserStatus.userSatatus.gasLimit,
//                                          "gasPrice" : UserStatus.userSatatus.gasPrice]
//
//        let data = try? JSONSerialization.data(withJSONObject: parameters)
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.httpBody = data
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest){ (data, response,error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//            guard let response =  response as? HTTPURLResponse else {return}
//
//            if response.statusCode == 200 {
//                guard let data  = data else { return}
//                DispatchQueue.main.async {
//                    do{
//                        let decodeDetails = try JSONDecoder().decode([foodDetails].self, from: data)
//                        self.events = decodeDetails
//                        successScan = true
//                    } catch let error {
//                        print("Error decoding", error)
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//        let cultivationModal: _cultivationModel = cultivationModal()
//        _cultivationModal.contractId = scannedCode
//        NavigationLink(destination: EventDetails(_cultivationModel).environmentObject(network),isActive: $successScan){
//            Text("")
//
//        }
//    }
    
    var scannerSheet: some View{
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result{
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    self.isPresenting = true
                    
                    
                }
                
            }
        )
    }
    var body: some View {
        VStack(spacing: 10){
            Text(scannedCode)
            Button("Scan a QR Code"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            
            if ( self.isPresenting ) {
                var _cultivationModal: cultivationModel = cultivationModel(_contractId: self.scannedCode)
                NavigationLink(destination: EventDetails(item:_cultivationModal, viewOnly: true).environmentObject(network),isActive: $isPresenting){
                    Text("")
                }
                .listRowSeparator(.hidden)
            }
        }
    }
}

//struct QRScanner_Previews: PreviewProvider {
//    static var previews: some View {
//        QRScanner()
//    }
//}
