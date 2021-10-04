// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

public extension CAN {

    /// A CAN frame
    struct Frame {

        /// The sender or receiver arbitration id. Arbitration ids can be 11-bit or 29-bit.
        let id: CAN.ArbitrationId
        /// Data Length Code
        let dlc: Int
        /// Data bytes
        let data: [UInt8]
        /// Receiving timestamp. Not used when sending frames.
        let timestamp: Double

        /// Create padded CAN frame from data. DLC is hardcoded to 8.
        init(id: UInt32, padded data: [UInt8], pad: UInt8 = 0xAA) {
            self.id = id
            var data = data
            while data.count < 8 { data.append(pad) }
            self.dlc = data.count
            self.data = data
            self.timestamp = 0
        }

        /// Create unpadded CAN frame from data. DLC is taken from length of data.
        init(id: UInt32, unpadded data: [UInt8]) {
            self.id = id
            self.dlc = data.count
            self.data = data
            self.timestamp = 0
        }
    }
}
