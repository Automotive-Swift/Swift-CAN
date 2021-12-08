// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

/// A CANbus interface.
public protocol _CANInterface {

    /// The vendor name.
    var vendor: String { get }
    /// The model name.
    var model: String { get }
    /// The serial number.
    var serialNumber: String { get }

    /// The current bitrate.
    var bitrate: Int { get }
    /// The interface name.
    var name: String { get }

    /// Open the interface with the chosen `bitrate`.
    func open(bitrate: Int) throws
    /// Close the interface.
    func close() throws
    /// Read a CAN frame with a `timeout` in milliseconds.
    /// If you specify a non-null `timeout`, the call will `throw` an error if nothing could be read within the defined time interval.
    func read(timeout: Int) throws -> CAN.Frame
    /// Write a CAN frame.
    func write(_ frame: CAN.Frame) throws
}

extension CAN { public typealias Interface = _CANInterface }

extension CAN.Interface {

    var vendor: String { "Unknown Vendor" }
    /// The model name.
    var model: String { "Unknown Model" }
    /// The serial number.
    var serialNumber: String { "Unknown Serial Number" }
}
