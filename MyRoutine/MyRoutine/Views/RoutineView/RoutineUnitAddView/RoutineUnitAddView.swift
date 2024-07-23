//
//  RoutineUnitAddView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/22/24.
//

import SwiftUI

struct RoutineUnitAddView: View {
    @ObservedObject var viewModel = RoutineUnitAddViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                
                HStack(alignment: .center) {
                                        
                    Button {
                        
                    } label: {
                        Text("Back")
                    }
                                        
                    Text("Create Routine")
                                        
                }
                .padding(.horizontal, 24)
                
               
                GeometryReader { _ in
                    VStack(spacing: 16) {
                        Spacer()
                            .frame(height: 20)
                        
                        ScrollView {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Type")
                                        .font(NotoSansKRFont(fontStyle: .bold, size: 15).font())
                                    
                                    Spacer()
                                }
                                
                                Picker("Segment", selection: $viewModel.type) {
                                    ForEach(RoutineUnitType.allCases, id: \.id) { type in
                                        Text(type.typeName)
                                            .tag(type)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.vertical, 12)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Title")
                                        .font(NotoSansKRFont(fontStyle: .bold, size: 15).font())
                                    
                                    Spacer()
                                }
                                
                                TextField(text: $viewModel.title) {
                                    Text("Title을 입력해주세요.")
                                }
                                .padding(.vertical, 12)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Tip")
                                        .font(NotoSansKRFont(fontStyle: .bold, size: 15).font())
                                    
                                    Spacer()
                                }
                                
                                TextEditor(text: $viewModel.tip)
                                    .frame(height: 200)
                                    .cornerRadius(8)
                            }
                            
                            
                            Button {
                                
                            } label: {
                                Text("추가하기")
                            }
                        }
                        

                        Spacer()
                        
                    }
                    .padding(.horizontal, 20)
                }
                .background(Color.background001)
            }
        }
    }
}

#Preview {
    RoutineUnitAddView()
}
