//
//  CustomOperator.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 05.08.2024.
//

import Foundation

postfix operator ====

postfix func ====(input: String) -> String {
    input.count > 4 ? "" : input
}
