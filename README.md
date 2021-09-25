# ScanTextField

A SwiftUI wrapper around `UIAction.captureTextFromCamera`

## Installation

Install via Swift Package Manager:

```
https://github.com/chFlorian/ScanTextField
```

## Usage

The package contains a single UIViewRepresentable, that can be used anywhere in a SwiftUI View:

```swift
import ScanTextField
```

```swift
struct ContentView: View {
    @State var text = ""
    
    var body: some View {
        VStack {
            ScanTextField("Enter name", text: $text)
                .padding(8)
                .frame(height: 30)
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}
```
