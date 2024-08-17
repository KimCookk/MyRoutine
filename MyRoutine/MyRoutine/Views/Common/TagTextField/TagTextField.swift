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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    TagCardView(tag: tag, styleColor: .black) { tag in
                        withAnimation(.spring) {
                            tags.removeAll(where: {
                                $0 == tag
                            })
                        }
                    }
                }
                
                TextFieldWrapper(inputText: $inputText,
                                 placeholder: placeholder)
                .updatePlaceholder("Enter Tags")
                .onSubmit {
                    if(inputText.isEmpty == false) {
                        addTag(inputText)
                        inputText = ""
                    }
                }
                .onChange { oldValue, newValue in
                    if(inputText.hasSuffix(" ") && newValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false) {
                        print(String(inputText[..<inputText.index(before: inputText.endIndex)]))
                        addTag(String(inputText[..<inputText.index(before: inputText.endIndex)]))
                        inputText = ""
                    }
                }
                .onDelete { oldValue, newValue in
                    if !tags.isEmpty && (oldValue.isEmpty == true && newValue.isEmpty == true) {
                        let last = tags.removeLast()
                        inputText = last
                    }
                }
            }
        }
    }
    
    func addTag(_ tag: String) {
        if(!tags.contains(tag)) {
            self.tags.append(tag)
        }
    }
}

#Preview {
    TagTextField(tags: Binding.constant(["test", "test22"]),
                 placeholder: "Enter Tag")
}

struct TagCardView: View {
    
    let tag: String
    let styleColor: Color
    
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
                .lineLimit(1)
                
            Button {
                onDelete(tag)
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
