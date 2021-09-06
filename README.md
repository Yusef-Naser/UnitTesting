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

## Describe Objects upon Failure
```swift
struct StructWithDescription: CustomStringConvertible {
    let x: Int
    let y: Int
    var description: String { "(\(x), \(y))" }
}
func test_assertNil_withSelfDescribingType() {
    let optionalValue: StructWithDescription? =
    StructWithDescription(x: 1, y: 2)
    XCTAssertNil(optionalValue)
}
```
- Running this test gives us the following simplified failure message: XCTAssertNil failed: "(1, 2)" - XCTAssertNil() is one assertion that gives more information. That’s because it takes an object instead of a Boolean value. The assertions for equality also give more information, and we’ll look at them next. Even in the cases where we provide our own descriptive messages, it’s good to have an option to simplify the output. Keep CustomStringConvertible in your tool belt.

## Equality with Doubles and Floats
```swift
func test_floatingPointDanger() {
    let result = 0.1 + 0.2
    XCTAssertEqual(result, 0.3)
}
```
- Before running the test, try predicting the outcome. Do you have an expected result in your head?
- Okay, now run the test. You’ll see the following failure message: XCTAssertEqual failed: ("0.30000000000000004") is not equal to ("0.3") - What in the world is going on?
- We’re used to using ten digits to represent numbers. Can you write 1⁄3 in decimal notation? No. The sequence 0.3333… goes on forever, so anything you write down is an approximation. That’s just the way math works. Computers face the same problem, but everything boils down to 1s and 0s, so the tricky numbers are different. We report erratum • discuss Fudge Equality with Doubles and Floats • 13 can’t write 1⁄10 in binary notation. You can learn more about this at “What Every Programmer Should Know About Floating-Point Arithmetic.”1 Let’s get back to assertions. Since floating-point numbers are approximations, we need a hand-wavy way to assert equality—something that says, “These two numbers should be equal, more or less.” 
- Enter the following test:
```swift 
func test_floatingPointFixed() {
    let result = 0.1 + 0.2
    XCTAssertEqual(result, 0.3, accuracy: 0.0001)
}
```

- The accuracy parameter gives us a way to express the “more or less” fudge factor. Run this test and you’ll see that it passes. It’s hard to predict in advance which floating-point numbers will cause problems. So just use the accuracy parameter whenever you want to use XCTAssertEqual() with Double or Float types.

- Remember, when XCTAssertEqual() or XCTAssertNil() fail, they provide a fair bit of information. It’s usually enough. XCTAssertTrue() and XCTAssertFalse() only say they failed, but that too is often enough. We’re going to aim for tests that are so short, we won’t need to add any messages of our own.

## Choose the Right Assertion
<img src="assets/assertions.png" width="50%" />
