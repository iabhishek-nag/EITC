// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
import RxSwift
import RxCocoa
@testable import EITC


// MARK: - LoginViewModelProtocol

open class LoginViewModelProtocolMock: LoginViewModelProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var emailSubject: BehaviorRelay<String?> {
		get {	invocations.append(.p_emailSubject_get); return __p_emailSubject ?? givenGetterValue(.p_emailSubject_get, "LoginViewModelProtocolMock - stub value for emailSubject was not defined") }
		set {	invocations.append(.p_emailSubject_set(.value(newValue))); __p_emailSubject = newValue }
	}
	private var __p_emailSubject: (BehaviorRelay<String?>)?

    public var passwordSubject: BehaviorRelay<String?> {
		get {	invocations.append(.p_passwordSubject_get); return __p_passwordSubject ?? givenGetterValue(.p_passwordSubject_get, "LoginViewModelProtocolMock - stub value for passwordSubject was not defined") }
		set {	invocations.append(.p_passwordSubject_set(.value(newValue))); __p_passwordSubject = newValue }
	}
	private var __p_passwordSubject: (BehaviorRelay<String?>)?

    public var isValidForm: Observable<Bool> {
		get {	invocations.append(.p_isValidForm_get); return __p_isValidForm ?? givenGetterValue(.p_isValidForm_get, "LoginViewModelProtocolMock - stub value for isValidForm was not defined") }
	}
	private var __p_isValidForm: (Observable<Bool>)?






    fileprivate enum MethodType {
        case p_emailSubject_get
		case p_emailSubject_set(Parameter<BehaviorRelay<String?>>)
        case p_passwordSubject_get
		case p_passwordSubject_set(Parameter<BehaviorRelay<String?>>)
        case p_isValidForm_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {            case (.p_emailSubject_get,.p_emailSubject_get): return Matcher.ComparisonResult.match
			case (.p_emailSubject_set(let left),.p_emailSubject_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<BehaviorRelay<String?>>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_passwordSubject_get,.p_passwordSubject_get): return Matcher.ComparisonResult.match
			case (.p_passwordSubject_set(let left),.p_passwordSubject_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<BehaviorRelay<String?>>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_isValidForm_get,.p_isValidForm_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_emailSubject_get: return 0
			case .p_emailSubject_set(let newValue): return newValue.intValue
            case .p_passwordSubject_get: return 0
			case .p_passwordSubject_set(let newValue): return newValue.intValue
            case .p_isValidForm_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .p_emailSubject_get: return "[get] .emailSubject"
			case .p_emailSubject_set: return "[set] .emailSubject"
            case .p_passwordSubject_get: return "[get] .passwordSubject"
			case .p_passwordSubject_set: return "[set] .passwordSubject"
            case .p_isValidForm_get: return "[get] .isValidForm"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func emailSubject(getter defaultValue: BehaviorRelay<String?>...) -> PropertyStub {
            return Given(method: .p_emailSubject_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func passwordSubject(getter defaultValue: BehaviorRelay<String?>...) -> PropertyStub {
            return Given(method: .p_passwordSubject_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func isValidForm(getter defaultValue: Observable<Bool>...) -> PropertyStub {
            return Given(method: .p_isValidForm_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var emailSubject: Verify { return Verify(method: .p_emailSubject_get) }
		public static func emailSubject(set newValue: Parameter<BehaviorRelay<String?>>) -> Verify { return Verify(method: .p_emailSubject_set(newValue)) }
        public static var passwordSubject: Verify { return Verify(method: .p_passwordSubject_get) }
		public static func passwordSubject(set newValue: Parameter<BehaviorRelay<String?>>) -> Verify { return Verify(method: .p_passwordSubject_set(newValue)) }
        public static var isValidForm: Verify { return Verify(method: .p_isValidForm_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MovieCollectionCellViewModelProtocol

open class MovieCollectionCellViewModelProtocolMock: MovieCollectionCellViewModelProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var title: String {
		get {	invocations.append(.p_title_get); return __p_title ?? givenGetterValue(.p_title_get, "MovieCollectionCellViewModelProtocolMock - stub value for title was not defined") }
	}
	private var __p_title: (String)?

    public var posterPathURL: String {
		get {	invocations.append(.p_posterPathURL_get); return __p_posterPathURL ?? givenGetterValue(.p_posterPathURL_get, "MovieCollectionCellViewModelProtocolMock - stub value for posterPathURL was not defined") }
	}
	private var __p_posterPathURL: (String)?






    fileprivate enum MethodType {
        case p_title_get
        case p_posterPathURL_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {            case (.p_title_get,.p_title_get): return Matcher.ComparisonResult.match
            case (.p_posterPathURL_get,.p_posterPathURL_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_title_get: return 0
            case .p_posterPathURL_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .p_title_get: return "[get] .title"
            case .p_posterPathURL_get: return "[get] .posterPathURL"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func title(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_title_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func posterPathURL(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_posterPathURL_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var title: Verify { return Verify(method: .p_title_get) }
        public static var posterPathURL: Verify { return Verify(method: .p_posterPathURL_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - MovieViewModelProtocol

open class MovieViewModelProtocolMock: MovieViewModelProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var movies: PublishSubject<[Movie]> {
		get {	invocations.append(.p_movies_get); return __p_movies ?? givenGetterValue(.p_movies_get, "MovieViewModelProtocolMock - stub value for movies was not defined") }
		set {	invocations.append(.p_movies_set(.value(newValue))); __p_movies = newValue }
	}
	private var __p_movies: (PublishSubject<[Movie]>)?

    public var errorEvent: PublishSubject<ErrorResponse> {
		get {	invocations.append(.p_errorEvent_get); return __p_errorEvent ?? givenGetterValue(.p_errorEvent_get, "MovieViewModelProtocolMock - stub value for errorEvent was not defined") }
		set {	invocations.append(.p_errorEvent_set(.value(newValue))); __p_errorEvent = newValue }
	}
	private var __p_errorEvent: (PublishSubject<ErrorResponse>)?

    public var isLoaderActive: PublishSubject<Bool> {
		get {	invocations.append(.p_isLoaderActive_get); return __p_isLoaderActive ?? givenGetterValue(.p_isLoaderActive_get, "MovieViewModelProtocolMock - stub value for isLoaderActive was not defined") }
		set {	invocations.append(.p_isLoaderActive_set(.value(newValue))); __p_isLoaderActive = newValue }
	}
	private var __p_isLoaderActive: (PublishSubject<Bool>)?





    open func getPopularMovies() {
        addInvocation(.m_getPopularMovies)
		let perform = methodPerformValue(.m_getPopularMovies) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_getPopularMovies
        case p_movies_get
		case p_movies_set(Parameter<PublishSubject<[Movie]>>)
        case p_errorEvent_get
		case p_errorEvent_set(Parameter<PublishSubject<ErrorResponse>>)
        case p_isLoaderActive_get
		case p_isLoaderActive_set(Parameter<PublishSubject<Bool>>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getPopularMovies, .m_getPopularMovies): return .match
            case (.p_movies_get,.p_movies_get): return Matcher.ComparisonResult.match
			case (.p_movies_set(let left),.p_movies_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<PublishSubject<[Movie]>>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_errorEvent_get,.p_errorEvent_get): return Matcher.ComparisonResult.match
			case (.p_errorEvent_set(let left),.p_errorEvent_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<PublishSubject<ErrorResponse>>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_isLoaderActive_get,.p_isLoaderActive_get): return Matcher.ComparisonResult.match
			case (.p_isLoaderActive_set(let left),.p_isLoaderActive_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<PublishSubject<Bool>>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getPopularMovies: return 0
            case .p_movies_get: return 0
			case .p_movies_set(let newValue): return newValue.intValue
            case .p_errorEvent_get: return 0
			case .p_errorEvent_set(let newValue): return newValue.intValue
            case .p_isLoaderActive_get: return 0
			case .p_isLoaderActive_set(let newValue): return newValue.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getPopularMovies: return ".getPopularMovies()"
            case .p_movies_get: return "[get] .movies"
			case .p_movies_set: return "[set] .movies"
            case .p_errorEvent_get: return "[get] .errorEvent"
			case .p_errorEvent_set: return "[set] .errorEvent"
            case .p_isLoaderActive_get: return "[get] .isLoaderActive"
			case .p_isLoaderActive_set: return "[set] .isLoaderActive"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func movies(getter defaultValue: PublishSubject<[Movie]>...) -> PropertyStub {
            return Given(method: .p_movies_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func errorEvent(getter defaultValue: PublishSubject<ErrorResponse>...) -> PropertyStub {
            return Given(method: .p_errorEvent_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func isLoaderActive(getter defaultValue: PublishSubject<Bool>...) -> PropertyStub {
            return Given(method: .p_isLoaderActive_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getPopularMovies() -> Verify { return Verify(method: .m_getPopularMovies)}
        public static var movies: Verify { return Verify(method: .p_movies_get) }
		public static func movies(set newValue: Parameter<PublishSubject<[Movie]>>) -> Verify { return Verify(method: .p_movies_set(newValue)) }
        public static var errorEvent: Verify { return Verify(method: .p_errorEvent_get) }
		public static func errorEvent(set newValue: Parameter<PublishSubject<ErrorResponse>>) -> Verify { return Verify(method: .p_errorEvent_set(newValue)) }
        public static var isLoaderActive: Verify { return Verify(method: .p_isLoaderActive_get) }
		public static func isLoaderActive(set newValue: Parameter<PublishSubject<Bool>>) -> Verify { return Verify(method: .p_isLoaderActive_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getPopularMovies(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getPopularMovies, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

