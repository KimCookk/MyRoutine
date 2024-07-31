//
//  CustomNavigationBarView.swift
//  MyRoutine
//
//  Created by 김태성 on 7/26/24.
//

import SwiftUI

protocol NavigationBarViewConfigurable {
    associatedtype BackButton: View
    associatedtype TitleSectionView: View
    associatedtype OptionButton: View
    
    @ViewBuilder func backButton() -> BackButton
    @ViewBuilder func titleSectionView() -> TitleSectionView
    @ViewBuilder func optionButton() -> OptionButton
}

struct NavigationBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let useBackButton: Bool
    let title: String
    let options: [NavigationBarOptionButtomItem]
    
    var body: some View {
        HStack(spacing: 25) {
                backButton()
                    .opacity(useBackButton ? 1.0 : 0.0)
                    .frame(width: 60, alignment: .leading)
                
                titleSectionView()
                    .frame(maxWidth: .infinity)
                
                optionButton()
                    .opacity(options.count > 0 ? 1.0 : 0.0)
                    .frame(width: 60, alignment: .trailing)

            }
            .background(Color.clear)
            .padding(.vertical)
            .padding(.horizontal, 20)
        
    }
}

#Preview {
    NavigationBarView(useBackButton: true,
                      title: "Test",
                      options: [.edit, .add])
}

// 실제 Custom NavigationBar가 정의되고 draw되는 영역
extension NavigationBarView: NavigationBarViewConfigurable {
    
    @ViewBuilder
    func backButton() -> some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("icon.active.back")
                .resizable()
                .frame(width: 15, height: 15)
        })
    }
    
    @ViewBuilder
    func titleSectionView() -> some View {
        Text(title)
            .lineLimit(1)
            .font(NotoSansKRFont(fontStyle: .bold,
                                 size: 20).font())
    }
    
    @ViewBuilder
    func optionButton() -> some View {
        HStack(spacing: 25) {
            ForEach(options, id: \.id) { option in
                Button(action: {
                    
                }, label: {
                    Image(option.iconName)
                        .resizable()
                        .frame(width: 15, height: 15)
                })
            }
        }
    }
}
