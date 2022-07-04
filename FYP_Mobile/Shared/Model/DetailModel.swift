//
//  DetailModel.swift
//  FYP_Mobile (iOS)
//
//  Created by Randimal Geeganage on 2022-06-30.
//

import Foundation

struct foodDetails : Identifiable ,Codable {
    var id:Int {eventId}
    let eventId: Int
    let userId : Int?
    let firstName : String
    let lastName : String?
    let userType : Int?
    let foodName : String?
    let stage : Int?
    let date : String?
    let spec : String?
    let details : String?
    let certificationStatus : String?
}

struct startDetails : Codable {
    var privateKey : String
//    var gasPrice : Int
}

struct TransactionReceipt: Codable {
    let transactionHash: String
    let transactionIndex: Int
    let blockHash: String
    let blockNumber, cumulativeGasUsed, gasUsed: Int
    let contractAddress: String
    let root: String?
    let status, from: String
    let to: String?
    let logs: [String]?
    let logsBloom: String
    let revertReason, type, effectiveGasPrice: String?
    let statusOK: Bool
    let blockNumberRaw, cumulativeGasUsedRaw, gasUsedRaw, transactionIndexRaw: String
}
