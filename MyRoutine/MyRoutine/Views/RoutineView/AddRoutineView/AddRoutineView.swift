//
//  RoutineUnitAddView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/22/24.
//

import SwiftUI

struct AddRoutineView: View {
    @ObservedObject var addRoutineViewModel = AddRoutineViewModel()
    @ObservedObject var routineViewModel: RoutineViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    // Routine Unit Type Select Section
                    RoutineUnitTypeSelectView(selectedRoutineUnitType: $addRoutineViewModel.selectedType)
                    
                    // Routine Unit Type Option Section
                    RoutineUnitTypeOptionView(viewModel: addRoutineViewModel)
                    
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Title")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        VStack {
                            TextField(text: $addRoutineViewModel.title) {
                                Text("Title을 입력해주세요.")
                                    .font(NotoSansKRFont(fontStyle: .bold, size: 20).font())
                            }
                            Rectangle()
                                .fill(.gray001)
                                .frame(height: 1.5)
                        }
                    }
                    
                    // Tag Input Area
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Tag")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        TagTextField(tags: addRoutineViewModel.tags,
                                     placeholder: addRoutineViewModel.tagTextFieldPlaceholder)
                                    .frame(height: 35)
                    }
                    
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Tip")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        RoundedRectangle(cornerRadius: 9)
                            .fill(Color.gray003.opacity(0.4))
                            .overlay {
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(Color.white)
                                    .overlay {
                                        TextEditor(text: $addRoutineViewModel.tipComment)
                                            .font(NotoSansKRFont(fontStyle: .regular, size: 13).font())
                                            .cornerRadius(9)
                                            .padding(10)
                                    }
                                    .padding(2)
                            }
                            .frame(height: 200)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                
                    Button {
                        routineViewModel.addRoutineUnit(addRoutineViewModel.getRoutineUnit())
                        
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Routine Unit Add")
                            .font(NotoSansKRFont(fontStyle: .bold, size: 18).font())
                            .foregroundColor(.black001)
                            .padding()
                    }
                    .background(.purple002)
                    .cornerRadius(20)
                }
            }
            .padding(.horizontal, 20)
        }
        .customNavigationBarItems(title: "Unit Add",
                                  useBackButton: true,
                                  options: [])
    }
}

#Preview {
    AddRoutineView(routineViewModel: RoutineViewModel())
}


struct RoutineUnitTypeOptionView: View {
    @ObservedObject var viewModel: AddRoutineViewModel
    
    var body: some View {
        if(viewModel.useOptionView) {
            optionView(type: viewModel.selectedType)
        }
    }
    
    @ViewBuilder
    func optionView(type: RoutineUnitType) -> some View {
//        HStack(spacing: 25) {
//            // Timer : 시간 설정
//            // Counter : 횟수
//        }
        
        VStack(alignment: .center, spacing: 15) {
            // Header
            HStack {
                Text(type.typeName)
                    .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                
                Spacer()
            }
            // Input
            if(type == .timer) {
                timerOptionView()
            } else if (type == .counter) {
                counterOptionView()
            }
        }
    }
    
    @ViewBuilder
    func timerOptionView() -> some View {
        TimePickerView(selectedHour: Binding(get: {
            guard let task = viewModel.routineUnitTask as? TimerTask else {
                return 0
            }
            
            return task.targetTime.getHours()
        }, set: { newHours in
            viewModel.updateTimerTaskHours(newHours)
            
        }), selectedMinute: Binding(get: {
            guard let task = viewModel.routineUnitTask as? TimerTask else {
                return 0
            }
            
            return task.targetTime.getMinutes()
        }, set: { newMinutes in
            viewModel.updateTimerTaskMinutes(newMinutes)

        }), selectedSecond: Binding(get: {
            guard let task = viewModel.routineUnitTask as? TimerTask else {
                return 0
            }
            
            return task.targetTime.getSeconds()
        }, set: { newSeconds in
            viewModel.updateTimerTaskSeconds(newSeconds)

        }))
    }
    
    @ViewBuilder
    func counterOptionView() -> some View {
        CounterTextField(numberString: Binding( 
        get: {
            guard let task = viewModel.routineUnitTask as? CounterTask else {
                return "0"
            }
            
            return "\(task.targetCount)"
            
        }, set: { newValue in
            viewModel.updateCounterTaskCount(Int(newValue) ?? 0)
        }))
    }
}
