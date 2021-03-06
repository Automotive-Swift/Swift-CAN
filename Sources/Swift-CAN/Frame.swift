// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>
import Foundation

extension CAN {

    /// A CAN frame.
    public struct Frame {

        /// The sender or receiver arbitration id. Arbitration ids can be 11-bit or 29-bit.
        public let id: CAN.ArbitrationId
        /// Data Length Code
        public let dlc: Int
        /// Data bytes
        public let data: [UInt8]
        /// Receiving timestamp. Not used when sending frames.
        public let timestamp: Double

        /// Create a CAN frame with the specified DLC (data length code) `dlc` and `data`.
        /// While the DLC should match the data length, it is not a necessity.
        public init(id: UInt32, dlc: Int, unpadded data: [UInt8], timestamp: Double = 0) {
            self.id = id
            self.dlc = dlc
            self.data = data
            self.timestamp = timestamp
        }

        /// Create a padded CAN frame from data. DLC is hardcoded to 8.
        public init(id: UInt32, padded data: [UInt8], pad: UInt8 = 0xAA, timestamp: Double = 0) {
            self.id = id
            var data = data
            while data.count < 8 { data.append(pad) }
            self.dlc = data.count
            self.data = data
            self.timestamp = timestamp
        }

        /// Create an unpadded CAN frame from data. DLC is taken from length of data.
        public init(id: UInt32, unpadded data: [UInt8], timestamp: Double = 0) {
            self.id = id
            self.dlc = data.count
            self.data = data
            self.timestamp = timestamp
        }
    }
}

extension CAN.Frame: CustomStringConvertible {

    /// Format a CAN frame in the usual `candump`-compatible style with header, DLC, and data.
    /// Example: `7E0 [8] 11 22 33 44 55 66 77 88`
    public var description: String {
        let id = self.id > 0x7FF ? String(format: "%08X", self.id) : String(format: "%03X", self.id)
        let dlc = "[\(self.dlc)]"
        let data = self.data.map { String(format: "%02X", $0) }.joined(separator: " ")
        return "\(id) \(dlc) \(data)"
    }
}

extension CAN.Frame {

    /// Returns true, if this frame has a broadcast address.
    public var isBroadcast: Bool { self.id.isBroadcast }

    /// Returns the originator for this frame.
    /// NOTE: The result is only valid for standard CAN/OBD2 addressing!
    public var originator: CAN.ArbitrationId? {

        guard !self.isBroadcast else { return nil }
        if self.id < 0x800 {
            return self.id ^ 0x08
        } else {
            let id0 = UInt8(self.id >> 24 & 0xFF)
            let id1 = UInt8(self.id >> 16 & 0xFF)
            let id2 = UInt8(self.id >> 08 & 0xFF)
            let id3 = UInt8(self.id & 0xFF)
            return UInt32(id0) << 24 | UInt32(id1) << 16 | UInt32(id3) << 8 | UInt32(id2)
        }
    }
}

