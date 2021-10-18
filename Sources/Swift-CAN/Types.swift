// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

public extension CAN {

    /// The adressing unit. Allowed are 11-bit or 29-bit addresses.
    typealias ArbitrationId = UInt32

    /// Functional adresses when talking to all ECUs
    static let BroadcastArbitrationId11: ArbitrationId = .init(0x7DF)
    static let BroadcastArbitrationId29: ArbitrationId = .init(0x18DB33F1)
}
