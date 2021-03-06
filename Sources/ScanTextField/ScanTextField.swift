import SwiftUI

public struct ScanTextField: UIViewRepresentable {
    public let placeholder: String
    @Binding public var text: String
    
    public init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let textFromCamera = UIAction.captureTextFromCamera(responder: context.coordinator, identifier: nil)
        let image = UIImage(systemName: "text.viewfinder")
        let toolbarItem = UIBarButtonItem(title: nil, image: image, primaryAction: textFromCamera, menu: nil)
        
        let textfield = UITextField()
        let bar = UIToolbar()
        bar.items = [toolbarItem]
        bar.sizeToFit()
        textfield.inputAccessoryView = bar
        textfield.placeholder = placeholder
        textfield.delegate = context.coordinator
        textfield.text = text
        
        return textfield
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        if let uiView = uiView as? UITextField {
            uiView.text = text
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: UIResponder, UIKeyInput, UITextFieldDelegate {
        public let parent: ScanTextField
        
        public var hasText: Bool {
            !parent.text.isEmpty
        }
        
        public init(_ parent: ScanTextField) {
            self.parent = parent
        }
        
        public func insertText(_ text: String) {
            parent.text = text
        }
        
        public func deleteBackward() { }
        
        public func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}
