//
//  TextFieldWrapper.swift
//  MyRoutine
//
//  Created by 김태성 on 8/7/24.
//

import SwiftUI
import UIKit

protocol DetectBackwardTextFieldDelegate: AnyObject {
    func textFieldDidDeleteBackward(_ textField: DetectBackwardTextField)
}

class DetectBackwardTextField: UITextField {
    weak var detectBackwardDelegate: DetectBackwardTextFieldDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        
        if let delegate = detectBackwardDelegate {
            delegate.textFieldDidDeleteBackward(self)
        }
    }
}

struct TextFieldWrapper: UIViewRepresentable {
    
    @Binding var inputText: String
    
    var preText: String = ""
    var placeholder: String
    
    var textOnSubmit: (() -> Void)?
    var textOnChange: ((_ oldValue: String, _ newValue: String) -> Void)?
    var textOnDelete: ((_ oldValue: String, _ newValue: String) -> Void)?
    
    class Coordinator: NSObject, UITextFieldDelegate, DetectBackwardTextFieldDelegate {
        
        var parent: TextFieldWrapper
        
        init(parent: TextFieldWrapper) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.inputText = textField.text ?? ""
                
                if let textOnChange = self.parent.textOnChange {
                    textOnChange(self.parent.preText, self.parent.inputText)
                }
                
                self.parent.preText = textField.text ?? ""
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if let textOnSubmit = parent.textOnSubmit {
                textOnSubmit()
            }
            
            return true
        }
        
        func textFieldDidDeleteBackward(_ textField: DetectBackwardTextField) {
            if let textOnDelete = parent.textOnDelete {
                textOnDelete(parent.preText, textField.text ?? "")
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> DetectBackwardTextField {
        let textField = DetectBackwardTextField()
        textField.delegate = context.coordinator
        textField.detectBackwardDelegate = context.coordinator
        textField.placeholder = placeholder
        
        return textField
        
    }
    
    func updateUIView(_ uiView: DetectBackwardTextField, context: Context) {
        uiView.text = inputText
    }
    
    func updatePlaceholder(_ text: String) -> TextFieldWrapper {
        var view = self
        
        view.placeholder = text
        return view
    }
    
    func onSubmit(_ submit: @escaping () -> Void) -> TextFieldWrapper {
        var view = self

        view.textOnSubmit = submit
        return view
    }
    
    func onChange(_ change: @escaping (_ oldValue: String, _ newValue: String) -> Void) -> TextFieldWrapper {
        var view = self

        view.textOnChange = change
        return view
    }
    
    func onDelete(_ delete: @escaping (_ oldValue: String, _ newValue: String) -> Void) -> TextFieldWrapper {
        var view = self

        view.textOnDelete = delete
        return view
    }
}
