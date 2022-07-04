//
//  QRScanner.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//
import SwiftUI
import CodeScanner

struct QRScanner: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started"
    
    var scannerSheet: some View{
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result{
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
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
        }
    }
}

struct QRScanner_Previews: PreviewProvider {
    static var previews: some View {
        QRScanner()
    }
}
