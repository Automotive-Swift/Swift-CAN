import XCTest
@testable import Swift_CAN

final class FrameTests: XCTestCase {

    func testOriginatorBroadcast() {

        let when1 = CAN.Frame(id: CAN.ArbitrationId.Broadcast11, padded: [])
        XCTAssertNil(when1.originator)

        let when2 = CAN.Frame(id: CAN.ArbitrationId.Broadcast29, padded: [])
        XCTAssertNil(when2.originator)
    }

    func testOriginator11() {

        let when1 = CAN.Frame(id: 0x7E0, padded: [])
        let peer1 = CAN.ArbitrationId(0x7E8)
        XCTAssertEqual(when1.originator, peer1)

        let when2 = CAN.Frame(id: 0x7E8, padded: [])
        let peer2 = CAN.ArbitrationId(0x7E0)
        XCTAssertEqual(when2.originator, peer2)
    }

    func testOriginator29() {

        let when1 = CAN.Frame(id: 0x18DA00F9, padded: [])
        let peer1 = CAN.ArbitrationId(0x18DAF900)
        XCTAssertEqual(when1.originator, peer1)

        let when2 = CAN.Frame(id: 0x18DAF900, padded: [])
        let peer2 = CAN.ArbitrationId(0x18DA00F9)
        XCTAssertEqual(when2.originator, peer2)
    }
}
