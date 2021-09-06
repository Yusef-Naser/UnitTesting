# iOS Unit Testing

## What Are Unit Tests Anyway?
- Unit tests are a subset of automated tests where the feedback is quick, consistent, and unambiguous.
- Quick: A single unit test should complete in milliseconds. We want thousands of such tests.
- Consistent: Given the same code, a unit test should report the same results.The order of test execution shouldn’t matter. Global state shouldn’t matter.
- Unambiguous: A failing unit test should clearly report the problem it detected.

## Avoid Conditionals in Tests
- For example, it might be tempting to test a Boolean result like this:
```swift
func test_avoidConditionalCode() {
    let success = false
    if !success {
        XCTFail()
    }
}
```
- That would be fine if we didn’t have other assertions. But we do. Try adding and running this next test. It achieves the same result but in a more declarative way.
```swift
func test_assertTrue() {
    let success = false
    XCTAssertTrue(success)
}
```
- By using the Boolean assertions XCTAssertTrue() and XCTAssertFalse(), we can avoid
many conditionals in our test code.
