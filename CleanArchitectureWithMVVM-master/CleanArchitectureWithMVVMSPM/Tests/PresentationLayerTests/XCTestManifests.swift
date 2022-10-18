import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DailyWeatherViewModelTests.allTests),
        testCase(DailyWeatherViewTests.allTests),
    ]
}
#endif
