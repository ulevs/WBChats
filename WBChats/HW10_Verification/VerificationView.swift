//
//  VerificationView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 19.07.2024.
//

import SwiftUI

import SwiftUI

struct VerificationView: View {
    @State private var phoneNumber: String = ""
    @State private var isProcessing: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Введите номер телефона")
                .font(.title)
                .foregroundColor(.primary)
                .padding(.bottom, 5)
            
            Text("Мы вышлем код подтверждения на указанный номер")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            HStack {
                Image(systemName: "flag.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)
                
                Text("+7")
                    .foregroundColor(.primary)
                
                TextField("000 000-00-00", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            if isProcessing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                    .scaleEffect(1.5)
                    .padding(.top, 20)
            } else {
                Button(action: {
                    withAnimation {
                        isProcessing = true
                    }
                    // Simulate a network request or processing delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        // Handle post-processing here
                        withAnimation {
                            isProcessing = false
                        }
                    }
                }) {
                    Text("Продолжить")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}


#Preview {
    VerificationView()
}
