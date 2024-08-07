//
//  TextFieldWrapper.swift
//  MyRoutine
//
//  Created by 김태성 on 8/7/24.
//

import SwiftUI
import UIKit

//protocol CustomTextFieldDelegate: AnyObject {
//    func textFieldDidDeleteBackward(_ textField: TextField)
//}

struct TextFieldWrapper: UIViewRepresentable {
    
    @Binding var inputText: String
    
    var preText: String = ""
    var placeholder: String
    
    var onSubmit: (() -> Void)?
    var onChange: ((_ oldValue: String, _ newValue: String) -> Void)?
    var onDelete: ((_ oldValue: String, _ newValue: String) -> Void)?
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldWrapper
        
        init(parent: TextFieldWrapper) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.inputText = textField.text ?? ""
                
                if let onChange = self.parent.onChange {
                    onChange(self.parent.preText, self.parent.inputText)
                }
                
                self.parent.preText = textField.text ?? ""
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if let onSubmit = parent.onSubmit {
                onSubmit()
            }
            
            return true
        }
        
        func textFieldDidDeleteBackward(_ textField: UITextField) {
            if let onDelete = parent.onDelete {
                onDelete(parent.preText, textField.text ?? "")
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = inputText
    }
    
    func updatePlaceholder(_ text: String) ->  TextFieldWrapper{
        var view = self
        view.placeholder = text
        return view
    }
}
