//
//  CalendarView.swift
//  WBChats
//
//  Created by Ульяна Евстигнеева on 10.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var selectedLanguage: Language = .english
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Picker("Language", selection: $selectedLanguage) {
                ForEach(Language.allCases) { language in
                    Text(language.flag).tag(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            ForEach(dateStrings(for: selectedDate, in: selectedLanguage), id: \.self) { dateString in
                Text(dateString)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
            }
        }
        .padding()
    }
    
    func dateStrings(for date: Date, in language: Language) -> [String] {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = language.locale
        formatter.dateStyle = .full
        
        let dates = [
            calendar.date(byAdding: .day, value: -2, to: date)!,
            calendar.date(byAdding: .day, value: -1, to: date)!,
            date,
            calendar.date(byAdding: .day, value: 1, to: date)!,
            calendar.date(byAdding: .day, value: 2, to: date)!
        ]
        
        let dayDescriptions = language.dayDescriptions
        
        var dateStrings: [String] = []
        for (index, date) in dates.enumerated() {
            let dateString = formatter.string(from: date)
            if index == 2 {
                dateStrings.append("\(dayDescriptions[index]): \(dateString)")
            } else {
                dateStrings.append("\(dayDescriptions[index]): \(dateString)")
            }
        }
        
        return dateStrings
    }
}

#Preview {
    ContentView()
}
