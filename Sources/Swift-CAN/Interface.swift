// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>

public protocol _CANInterface {

    func open() throws
    func close() throws
    func read(timeout: Double) throws -> CAN.Frame
    func write(_ frame: CAN.Frame) throws
}

extension CAN { public typealias Interface = _CANInterface }