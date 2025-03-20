# SwiftToast

![Swift 5.8](https://img.shields.io/badge/swift-5.8-ED523F.svg?logo=swift&style=flat)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/matthew-2000/SwiftToast.svg)](https://github.com/matthew-2000/SwiftToast/releases)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/matthew-2000/SwiftToast/pulls)

## 🚀 About SwiftToast
**SwiftToast** is a lightweight and customizable SwiftUI library for displaying non-intrusive toast messages in your iOS/macOS applications. Designed for simplicity and flexibility, it allows you to show short notifications with custom styling and animations.

## ✨ Features
- 📌 **Easy to use**: Simple API for quick integration
- 🎨 **Customizable**: Change colors, fonts, durations, and positions
- 🎭 **Smooth animations**: Fade, slide, bounce, and more
- 🎯 **Positioning**: Show toast at the top or bottom of the screen
- 🔄 **Supports Swift Package Manager (SPM)**

---

## 📦 Installation

### **Using Swift Package Manager (SPM)**
1. Open your Xcode project.
2. Go to **File > Add Packages...**
3. Enter the following URL:
   ```
   https://github.com/matthew-2000/SwiftToast.git
   ```
4. Choose **Latest Version** and click **Add Package**.

---

## 🛠 Usage

### **1️⃣ Basic Usage**
To display a simple toast message:

```swift
import SwiftUI
import SwiftToast

struct ContentView: View {
    @State private var showToast = false
    
    var body: some View {
        VStack {
            Button("Show Toast") {
                showToast = true
            }
        }
        .toast(isPresented: $showToast, message: "Hello, SwiftToast!")
    }
}
```

---

### **2️⃣ Customization**
You can customize the toast appearance, duration, and position:

```swift
.toast(
    isPresented: $showToast,
    message: "Customized Toast!",
    duration: 3,
    backgroundColor: .blue,
    textColor: .white,
    font: .headline,
    position: .top,
    animationStyle: .bounce
)
```

#### 🎨 **Customization Options:**
| Parameter         | Type               | Default Value          | Description |
|------------------|--------------------|------------------------|-------------|
| `message`       | `String`           | **Required**           | The toast text |
| `duration`      | `TimeInterval`      | `2` seconds            | How long the toast is visible |
| `backgroundColor` | `Color`           | `.black.opacity(0.8)`   | Background color |
| `textColor`     | `Color`             | `.white`               | Text color |
| `font`          | `Font`              | `.body`                | Font style |
| `position`      | `VerticalAlignment` | `.bottom`              | `.top` or `.bottom` |
| `animationStyle` | `ToastAnimationStyle` | `.slide`          | `.fade`, `.slide`, `.bounce`, `.scale`, `.custom(...)` |

---

## 🎭 Animations
SwiftToast includes built-in animations, or you can add your own:
```swift
.toast(
    isPresented: $showToast,
    message: "Spring animation!",
    animationStyle: .spring(response: 0.5, dampingFraction: 0.6)
)
```

### **Available animations:**
- `.fade` → Simple fade in/out
- `.slide` → Smooth slide transition
- `.bounce` → Spring-like bounce effect
- `.scale` → Scale-in effect
- `.custom(Animation)` → Use your own animation

---

## ✅ Testing
To run unit tests:
```sh
swift test
```
Or, in Xcode: **Cmd + U** to run all tests.

---

## 🌟 Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request.

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature-name`)
3. **Commit your changes** (`git commit -m "Add new feature"`)
4. **Push to the branch** (`git push origin feature-name`)
5. **Open a pull request** 🚀

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💡 Credits
Developed by **Matteo Ercolino** • [GitHub](https://github.com/matthew-2000)

---

## 📢 Support
If you find this project useful, ⭐️ star the repository and share it with others!

---

🚀 Happy coding with **SwiftToast**! 🎉

