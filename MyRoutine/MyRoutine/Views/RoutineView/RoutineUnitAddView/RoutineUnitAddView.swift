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
            VStack(spacing: 16) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Type")
                                .font(NotoSansKRFont(fontStyle: .bold, size: 13).font())
                            
                            Spacer()
                        }
                        
                        Picker("Segment", selection: $viewModel.type) {
                            ForEach(RoutineUnitType.allCases, id: \.id) { type in
                                Text(type.typeName)
                                    .tag(type)
                            }
                        }
                        .pickerStyle(.segmented)
                        //.controlSize(.extraLarge)
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
        .customNavigationBarItems(title: "Unit Add",
                                  useBackButton: true,
                                  options: [])
    }
}

#Preview {
    RoutineUnitAddView()
}
