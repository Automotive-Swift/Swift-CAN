// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

public extension CAN {

    typealias ArbitrationId = UInt32

    /// Functional adresses when talking to all ECUs
    static let BroadcastArbitrationId11: ArbitrationId = .init(0x7DF)
    static let BroadcastArbitrationId29: ArbitrationId = .init(0x18DB33F1)
}
