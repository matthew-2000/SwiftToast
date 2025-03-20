import SwiftUI

public enum ToastAnimationStyle {
    case fade, slide, bounce, scale, custom(Animation)
    
    var animation: Animation {
        switch self {
        case .fade:
            return .easeInOut(duration: 0.5)
        case .slide:
            return .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.3)
        case .bounce:
            return .interpolatingSpring(stiffness: 120, damping: 10)
        case .scale:
            return .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.2)
        case .custom(let anim):
            return anim
        }
    }
}

public struct ToastView: View {
    let message: String
    let duration: TimeInterval
    let backgroundColor: Color
    let textColor: Color
    let font: Font
    let position: VerticalAlignment
    let animationStyle: ToastAnimationStyle
    @Binding var isPresented: Bool

    @State private var scale: CGFloat = 0.9
    @State private var opacity: Double = 0
    @State private var offsetY: CGFloat = 100

    public init(
        message: String,
        duration: TimeInterval = 2,
        backgroundColor: Color = Color.black.opacity(0.8),
        textColor: Color = .white,
        font: Font = .body,
        position: VerticalAlignment = .bottom,
        animationStyle: ToastAnimationStyle = .slide,
        isPresented: Binding<Bool>
    ) {
        self.message = message
        self.duration = duration
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.font = font
        self.position = position
        self.animationStyle = animationStyle
        self._isPresented = isPresented
    }

    public var body: some View {
        VStack {
            if position == .bottom { Spacer() }
            
            Text(message)
                .font(font)
                .bold()
                .padding()
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(12)
                .shadow(color: .black.opacity(opacity * 0.3), radius: 10, x: 0, y: 5)
                .scaleEffect(scale)
                .offset(y: offsetY)
                .opacity(opacity)
                .onAppear {
                    withAnimation(animationStyle.animation) {
                        scale = 1
                        opacity = 1
                        offsetY = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation(animationStyle.animation) {
                            scale = 0.9
                            opacity = 0
                            offsetY = 100
                        }
                        startDismissTimer()
                    }
                }
            
            if position == .top { Spacer() }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 50)
    }
    
    func startDismissTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            isPresented = false
        }
    }

}

public extension View {
    func toast(
        isPresented: Binding<Bool>,
        message: String,
        duration: TimeInterval = 2,
        backgroundColor: Color = Color.black.opacity(0.8),
        textColor: Color = .white,
        font: Font = .body,
        position: VerticalAlignment = .bottom,
        animationStyle: ToastAnimationStyle = .slide
    ) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                ToastView(
                    message: message,
                    duration: duration,
                    backgroundColor: backgroundColor,
                    textColor: textColor,
                    font: font,
                    position: position,
                    animationStyle: animationStyle,
                    isPresented: isPresented // 🔥 Passiamo il binding per aggiornarlo!
                )
            }
        }
    }
}
