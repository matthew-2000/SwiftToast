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
    
    @MainActor func testToastHidesAfterDuration() {
        let expectation = XCTestExpectation(description: "Toast should disappear after duration")
        
        // Creiamo un Binding finto che monitora quando cambia
        var isPresented = true
        let showToast = Binding<Bool>(
            get: { isPresented },
            set: { newValue in
                isPresented = newValue
                if !newValue {
                    expectation.fulfill()
                }
            }
        )

        // Creiamo il ToastView
        let toast = ToastView(
            message: "Test Message",
            duration: 2,
            isPresented: showToast
        )

        toast.startDismissTimer()

        // Aspettiamo fino alla fine del timeout
        wait(for: [expectation], timeout: 3)
        
        // Verifichiamo che il Toast sia effettivamente scomparso
        XCTAssertFalse(isPresented, "ToastView should be hidden after the duration")
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
