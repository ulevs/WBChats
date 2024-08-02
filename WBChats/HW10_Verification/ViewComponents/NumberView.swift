//
//  TestView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 20.07.2024.
//
//import SwiftUI
//import iPhoneNumberField
//import Introspect
//
//struct PhoneInputView: View {
//  @State private var isEditing: Bool = false
//  @State private var phoneNumberInput: String = ""
//
//  @ObservedObject var authFlowContext: AuthFlowContext
//  @Environment(\.regularClosure) var onBack
//  @Environment(\.boolClosure) var onNext
//
//  init(authFlowContext: AuthFlowContext) {
//    self.authFlowContext = authFlowContext
//    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    UITextField.appearance().keyboardAppearance = .dark
//  }
//
//  var body: some View {
//    ZStack {
//      ScrollView(.vertical) {
//        VStack {
//          titleView
//          phoneInputContainer
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//      }
//      VStack {
//        Spacer()
//        nextButton
//      }
//    }
//    .navigationTitle("Profile")
//    .background(Color.black)
//    .navigationBarTitleDisplayMode(.inline)
//    .toolbar {
//      ToolbarItem(placement: .navigationBarLeading) {
//        backButton
//      }
//    }
//  }
//
//  var titleView: some View {
//    VStack {
//      Image("streamlayer_logo", bundle: .module)
//      titleText
//      subtitleText
//    }
//
//    .padding([.top], 70)
//  }
//
//  var titleText: some View {
//    Text("Enter your phone number")
//      .font(Font.system(size: 24, weight: .semibold))
//      .foregroundColor(Color.white)
//      .padding([.top], 24)
//      .padding([.horizontal], 50)
//      .multilineTextAlignment(.center)
//  }
//
//  var subtitleText: some View {
//    Text("Enter your phone number to log in or sign up for an account.")
//      .font(Font.system(size: 14, weight: .regular))
//      .foregroundColor(Color.subtitle)
//      .padding([.top], 1)
//      .padding([.horizontal], 80)
//      .multilineTextAlignment(.center)
//  }
//
//  var phoneInputContainer: some View {
//    HStack(alignment: .center) {
//      Spacer()
//      phoneInput
//        .padding(.top, 60)
//      Spacer()
//    }
//  }
//
//  var backButton: some View {
//    Button {
//      self.onBack?()
//    } label: {
//      Image("icon_chevron_left", bundle: .module)
//    }
//  }
//
//  var phoneInput: some View {
//    iPhoneNumberField(nil, text: $phoneNumberInput, isEditing: $isEditing) {
//      $0.withExamplePlaceholder = true
//      $0.numberPlaceholderColor = .placeholder
//      $0.countryCodePlaceholderColor = .placeholder
//      $0.inputAccessoryView = nil
//    }
//    .flagHidden(false)
//    .flagSelectable(true)
//    .prefixHidden(false)
//    .autofillPrefix(true)
//    .font(UIFont(size: 22, weight: .regular))
//    .foregroundColor(Color.white)
//    .clearButtonMode(.whileEditing)
//    .onClear { _ in isEditing.toggle() }
//    .onNumberChange { phoneNumber in
//      authFlowContext.phoneNumberChanged(to: phoneNumber)
//    }
//    .onReturn { _ in
//      Task {
//        await self.authFlowContext.requestOTP()
//        await MainActor.run {
//          self.onNext?(false)
//        }
//      }
//    }
//    .frame(width: 230)
//    .introspectTextField(customize: { textField in
//      textField.autocorrectionType = .no
//      textField.inputAccessoryView = nil
//      DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
//        textField.becomeFirstResponder()
//      }
//    })
//  }
//
//  var nextButton: some View {
//    BlueButton(title: "Next", isLoading: authFlowContext.state.isLoading, isDisabled: !authFlowContext.state.isPhoneNumberValid) {
//      Task {
//        await self.authFlowContext.requestOTP()
//        await MainActor.run {
//          self.onNext?(false)
//        }
//      }
//    }
//    .padding(.horizontal, 16)
//    .padding(.bottom, 16)
//    .frame(minHeight: 40)
//  }
//}
//
//struct PhoneInputView_Previews: PreviewProvider {
//  static var previews: some View {
//    PhoneInputView(authFlowContext: AuthFlowContext.makeDefault())
//  }
//}
import SwiftUI
//HStack {
//    Image(systemName: "")
//        .resizable()
//        .frame(width: 24, height: 24)
//    
//    Text("+7")
//        .foregroundStyle(.primary)
//    
//    TextField("000 000-00-00", text: $phoneNumber)
//        .background(Color(.wbTintBG))
//        .keyboardType(.numberPad)
//        .textFieldStyle(RoundedBorderTextFieldStyle())
//}
//.padding()
//.background(Color(.wbTintBG))
//.cornerRadius(10)
//.padding(.horizontal)


struct NumberView: View {
    @State var contact: VerificationModel
    
    var body: some View {
        HStack(spacing: 8) {
            Text("🇷🇺 +7")
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.wbTintBG)
                )

            TextField("000 000-00-00", text: $contact.phoneNumber)
        
                .keyboardType(.numberPad)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.wbTintBG)
                )
                .onChange(of: contact.phoneNumber) { oldValue, newValue in
                    let formatted = formatPhoneNumber(newValue)
                    if contact.phoneNumber != formatted {
                        contact.phoneNumber = formatted
                    }
                }
        }
        .padding(8)
        .font(.system(size: 14))
        .bold()
        .foregroundStyle(.gray)
        .frame(width: 327, height: 36)
    }
    
    func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }
        
        let mask = "XXX XXX-XX-XX"
        var result = ""
        var index = digits.startIndex
        
        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
}

#Preview {
    NumberView(contact: VerificationModel(phoneNumber: ""))
}
import Foundation

struct VerificationModel {
    var phoneNumber: String = ""
}
