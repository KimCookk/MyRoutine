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
    let useOptionButton: Bool
    
    var body: some View {
        HStack {
            backButton()
                .opacity(useBackButton ? 1.0 : 0.0)
            
            Spacer()
            
            titleSectionView()
            
            Spacer()
            
            backButton()
                .opacity(useOptionButton ? 1.0 : 0.0)
        }
        .padding()
    }
}

#Preview {
    NavigationBarView(useBackButton: true, title: "Title", useOptionButton: false)
}

// 실제 Custom NavigationBar가 정의되고 draw되는 영역
extension NavigationBarView: NavigationBarViewConfigurable {
    
    @ViewBuilder
    func backButton() -> some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("icon.active.back")
        })
    }
    
    @ViewBuilder
    func titleSectionView() -> some View {
        Text(title)
            .font(NotoSansKRFont(fontStyle: .bold, size: 15).font())
    }
    
    @ViewBuilder
    func optionButton() -> some View {
        Button(action: {
            
        }, label: {
            
        })
    }
}
