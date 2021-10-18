// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>
import Foundation

extension CAN {

    /// A CAN frame
    public struct Frame {

        /// The sender or receiver arbitration id. Arbitration ids can be 11-bit or 29-bit.
        public let id: CAN.ArbitrationId
        /// Data Length Code
        public let dlc: Int
        /// Data bytes
        public let data: [UInt8]
        /// Receiving timestamp. Not used when sending frames.
        public let timestamp: Double

        /// Create a CAN frame
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
    
    public var description: String {
        let id = self.id > 0x7FF ? String(format: "%06X", self.id) : String(format: "%03X", self.id)
        let dlc = "[\(self.dlc)]"
        let data = self.data.map { String(format: "%02X", $0) }.joined(separator: " ")
        return "\(id) \(dlc) \(data)"
    }
}
