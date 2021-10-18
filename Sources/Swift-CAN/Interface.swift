// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

/// An CAN interface.
public protocol _CANInterface {

    /// Open the interface with the chosen `baudrate`.
    func open(baudrate: Int) throws
    /// Close the interface.
    func close() throws
    /// Read a CAN frame with a `timeout` in milliseconds.
    /// If you specify a non-null `timeout`, the call will `throw` an error if nothing could be read within the defined time interval.
    func read(timeout: Int) throws -> CAN.Frame
    /// Write a CAN frame.
    func write(_ frame: CAN.Frame) throws
}

extension CAN { public typealias Interface = _CANInterface }
