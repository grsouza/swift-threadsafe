import Foundation

/// Wraps value in a thread safe environemnt.
///
/// Reads and writes are made throught methods that are synchronized.
/// Reads are concurrent and writes are exclusive.
public final class ThreadSafe<Value> {

    private let queue: DispatchQueue
    private var value: Value

    /// Initialized ThreadSafe with initial value.
    /// - Parameters:
    ///   - value: Initial value
    ///   - qos: quality of service used when synchronizing reads/writes. Defaults to `userInitiated`
    public init(value: Value, qos: DispatchQoS = .userInitiated) {
        self.value = value
        self.queue = DispatchQueue(
            label: "dev.grds.swift.threadsafe",
            qos: qos,
            attributes: .concurrent
        )
    }

    public func read<Result>(_ block: (Value) throws -> Result) rethrows -> Result {
        try queue.sync {
            try block(value)
        }
    }

    public func write<Result>(_ block: (inout Value) throws -> Result) rethrows -> Result {
        try queue.sync(flags: .barrier) {
            try block(&value)
        }
    }

}
