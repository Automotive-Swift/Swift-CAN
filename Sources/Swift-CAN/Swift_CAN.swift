import Swift_SocketCAN

public struct Bus {

    private var canInterface: SocketCAN

    public init(iface: String) {

        self.canInterface = SocketCAN(iface: iface)
    }

    public operate() throws {
        try self.canInterface.open()

        while true {

        }
    }
}
