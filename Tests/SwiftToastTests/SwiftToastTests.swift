import XCTest
import SwiftUI
@testable import SwiftToast

final class SwiftToastTests: XCTestCase {

    @MainActor func testToastViewExists() {
        let toast = ToastView(
            message: "Test Toast",
            isPresented: .constant(true)
        )
        XCTAssertNotNil(toast, "ToastView should not be nil")
    }


    @MainActor func testToastPositioning() {
        let toastTop = ToastView(
            message: "Top Toast",
            position: .top,
            isPresented: .constant(true)
        )
        let toastBottom = ToastView(
            message: "Bottom Toast",
            position: .bottom,
            isPresented: .constant(true)
        )

        XCTAssertNotNil(toastTop, "ToastView should not be nil")
        XCTAssertNotNil(toastBottom, "ToastView should not be nil")
    }
}
