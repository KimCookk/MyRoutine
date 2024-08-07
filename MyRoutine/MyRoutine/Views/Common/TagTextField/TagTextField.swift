//
//  TagTextField.swift
//  MyRoutine
//
//  Created by 김태성 on 8/6/24.
//

import SwiftUI

struct TagTextField: View {
    @Binding var tags: [String]
    let placeholder: String
    
    @State private var inputText = ""
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                TagCardView(tag: tag, styleColor: .black) { tag in
                    tags.removeAll(where: {
                        $0 == tag
                    })
                }
            }
        }
    }
}

#Preview {
    TagTextField(tags: Binding.constant(["test"]),
                 placeholder: "Enter Tag")
}

struct TagCardView: View {
    
    let tag:String
    let styleColor:Color
    
    var backgroundColor: Color {
        return styleColor.opacity(0.1)
    }
    
    let onDelete: (String) -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Text(tag)
                .font(NotoSansKRFont(fontStyle: .regular
                                     , size: 12).font())
                .foregroundColor(styleColor)
                
            Button {
                
            } label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 10, height: 10)
            }
        }
        .padding(5)
        .background( RoundedRectangle(cornerRadius: 6.0)
            .fill(backgroundColor))
      
    }
}
