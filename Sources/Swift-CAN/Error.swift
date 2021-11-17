// This file is part of Swift-CAN. (C) Dr. Michael 'Mickey' Lauer <mickey@vanille-media.de>
extension CAN {

    /// Common errors when dealing with CAN interfaces
    public enum Error: Swift.Error {
        /// CAN is not supported on this platform.
        case canNotSupported
        /// The requested interface was not found.
        case interfaceNotFound
        /// The requested interface is not a CAN interface.
        case interfaceNotCan
        /// The requested configuration (e.g., bitrate) could not be applied.
        case unsupportedConfiguration
        /// Could not read from interface. Might be recoverable.
        case readError
        /// Could not write to interface. Might be recoverable.
        case writeError
        /// The requested operation did not happen within the expected timeframe.
        case timeout
        /// EOF from interface. Not recoverable.
        case eof
    }
}
