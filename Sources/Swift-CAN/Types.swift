// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

public extension CAN {

    /// The CAN adressing unit. Allowed are 11-bit or 29-bit addresses.
    typealias ArbitrationId = UInt32
}

public extension CAN.ArbitrationId {

    /// Functional CAN adresses when talking to all ECUs.
    static let Broadcast11: Self = 0x7DF
    static let Broadcast29: Self = 0x18DB33F1
}

public extension CAN.ArbitrationId {

    /// Returns `true`, if the sender is a CAN broadcast address.
    var isBroadcast: Bool { self == Self.Broadcast11 || self == Self.Broadcast29 }

}
