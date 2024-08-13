//
//  RoutineUnitAddView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/22/24.
//

import SwiftUI

struct RoutineUnitAddView: View {
    @State var viewModel = RoutineUnitAddViewModel()
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    // Type Select Area
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Type")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        // Type Cards View 
                        RoutineUnitTypeCardCollectionView(viewModel: viewModel)
                    }
                    
                    // Type Option Area
                    // Timer : 시간 설정
                    // Counter : 횟수
                    //if(viewModel.useOptionView) {
                        RoutineUnitTypeOptionView(viewModel: viewModel)
                    //}
                    
                    
                    // Title Input Area
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Title")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        VStack {
                            TextField(text: $viewModel.title) {
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
                        
                        TagTextField(tags: viewModel.tags,
                                     placeholder: viewModel.tagTextFieldPlaceholder)
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
                                        TextEditor(text: $viewModel.tip)
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
    RoutineUnitAddView()
}

struct RoutineUnitTypeCardCollectionView: View {
    
    @ObservedObject var viewModel: RoutineUnitAddViewModel
    
    var body: some View {
        VStack {
            HStack {
                RoutineUnitAddCardView(type: .todo,
                                       state: viewModel.selectedType == .todo ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped todo")
                    withAnimation(.spring) {
                        viewModel.selectedType = .todo
                    }
                }
                
                RoutineUnitAddCardView(type: .counter,
                                       state: viewModel.selectedType == .counter ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped counter")
                    withAnimation(.spring) {
                        viewModel.selectedType = .counter
                    }
                }
            }
            
            HStack {
                RoutineUnitAddCardView(type: .timer,
                                       state: viewModel.selectedType == .timer ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped timer")
                    withAnimation(.spring) {
                        viewModel.selectedType = .timer
                    }
                }
                
                RoutineUnitAddCardView(type: .stopWatch,
                                       state: viewModel.selectedType == .stopWatch ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped stopWatch")
                    withAnimation(.spring) {
                        viewModel.selectedType = .stopWatch
                    }
                }
            }
        }
    }
}

struct RoutineUnitTypeOptionView: View {
    @ObservedObject var viewModel: RoutineUnitAddViewModel
    
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
        TimePickerView()
    }
    
    @ViewBuilder
    func counterOptionView() -> some View {
        CounterTextField()
    }
}
