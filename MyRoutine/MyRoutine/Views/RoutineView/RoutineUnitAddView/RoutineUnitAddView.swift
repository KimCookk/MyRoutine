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
            ScrollView {
                VStack(spacing: 15) {
                    // Type Select Area
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Type")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        // Type Cards View 
                        RoutineUnitCardCollectionView(viewModel: viewModel)
                    }
                    
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
                                .frame(height: 1)
                        }
                    }
                    
                    // Tag Input Area
                    VStack(alignment: .center, spacing: 15) {
                        HStack {
                            Text("Tag")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
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
                }
                
                
                
                
                
                
                
                
                Button {
                    
                } label: {
                    Text("추가하기")
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

struct RoutineUnitCardCollectionView: View {
    
    @ObservedObject var viewModel: RoutineUnitAddViewModel
    
    var body: some View {
        VStack {
            HStack {
                RoutineUnitAddCardView(type: .todo,
                                       state: viewModel.selectedType == .todo ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped todo")
                    viewModel.selectedType = .todo
                }
                
                RoutineUnitAddCardView(type: .counter,
                                       state: viewModel.selectedType == .counter ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped counter")
                    viewModel.selectedType = .counter
                }
            }
            
            HStack {
                RoutineUnitAddCardView(type: .timer,
                                       state: viewModel.selectedType == .timer ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped timer")
                    viewModel.selectedType = .timer
                }
                
                RoutineUnitAddCardView(type: .stopWatch,
                                       state: viewModel.selectedType == .stopWatch ? Binding.constant(.selected) : Binding.constant(.normal))
                .onTapGesture {
                    print("tapped stopWatch")
                    viewModel.selectedType = .stopWatch
                }
            }
        }
    }
}
