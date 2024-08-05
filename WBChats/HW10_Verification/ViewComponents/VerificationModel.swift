//
//  VerificationModel.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 05.08.2024.
//

import Foundation

struct VerificationModel {
    var phoneNumber: String
    var code: String
}

struct MockDataVerification {
    static let contact = VerificationModel(phoneNumber: "", code: "4444")
}
