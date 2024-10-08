//
//  TimePickerView.swift
//  MyRoutine
//
//  Created by 김태성 on 8/12/24.
//

import SwiftUI

struct TimePickerView: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    @Binding var selectedSecond: Int
    
    var body: some View {
            HStack {
                // Hour Picker
                Picker(selection: $selectedHour, label: Text("Hour")) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
//                .frame(width: 100)
                .clipped()

                
                Text("h")
                    .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())

                // Minute Picker
                Picker(selection: $selectedMinute, label: Text("Minute")) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
//                .frame(width: 100)
                .clipped()
                
                Text("m")
                    .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())

                // Second Picker
                Picker(selection: $selectedSecond, label: Text("Second")) {
                    ForEach(0..<60) { second in
                        Text("\(second)").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
//                .frame(width: 100)
                .clipped()
                
                Text("s")
                    .font(NotoSansKRFont(fontStyle: .bold, size: 12).font())
            }
            .frame(height: 100)
    }
}

#Preview {
    TimePickerView(selectedHour: Binding.constant(1), selectedMinute: Binding.constant(1), selectedSecond: Binding.constant(1))
}
