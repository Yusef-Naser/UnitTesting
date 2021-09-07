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

-------------------

# Manage Your Test Life Cycles

## Observe Object Life Cycles to Learn the Phases of a Test
## FIRST Principles of Good Unit Tests
- [F]ast
- [I]solated
- [R]epeatable
- [S]elf-validating
- [T]imely


### Fast
- Unit tests should be fast otherwise they will slow down your development/deployment time and will take longer time to pass or fail. Typically on a sufficiently large system, there will be a few thousand unit tests – let’s say 2000 unit tests. If the average unit test takes 200 milliseconds to run (which shall be considered fast), then it will take 6.5 minutes to run complete suite. 6.5 minutes doesn’t seem long at this stage, but imagine if you run them on your development machine multiple times a day which will eat up your good amount of productive time. And imagine when the count of these tests increases when new functionalities are added to the application, it will further increase the test execution time. The value of your suite of unit tests diminishes as their ability to provide continual, comprehensive, and fast feedback about the health of your system also diminishes. One of the major causes of slow tests – is dependency that must handle external evil necessities such as databases, files, and network calls. They take thousands of milliseconds. So to make suite fast, you must avoid creating these dependencies by using mock testing.

### Isolated
- Never ever write tests which depend on other test cases. No matter how carefully you design them, there will always be possibilities of false alarms. To make the situation worse, you may end up spending more time figuring out which test in the chain has caused the failure. In the best-case scenario, you should be able to run anyone test at any time, in any order. By making independent tests, it’s easy to keep your tests focused only on a small amount of behavior. When this test fails, you know exactly what has gone wrong and where. No need to debug the code itself. The Single Responsibility Principle (SRP) of SOLID Class-Design Principles​ says that classes should be small and single-purpose. This can be applied to your tests as well. If one of your test methods can break for more than one reason, consider splitting it into separate tests.

### Repeatable
- A repeatable test is one that produces the same results each time you run it. To accomplish repeatable tests, you must isolate them from anything in the external environment, not under your direct control. In these cases, feel free to use mock objects. They have been designed for this very purpose. On occasion, you’ll need to interact directly with an external environmental influence such as a database. You’ll want to set up a private sandbox to avoid conflicts with other developers whose tests concurrently alter the database. In this situation, you may use in-memory databases. If tests are not repeatable then you will surely get some bogus test results and you can’t afford to waste time chasing down phantom problems.

### Self-validating
- Tests must be self-validating means – each test must be able to determine that the output is expected or not. It must determine it is failed or pass. There must be no manual interpretation of results. Manually verifying the results of tests is a time-consuming process that can also introduce more risk. Make sure you don’t do anything silly, such as designing a test to require manual arrange steps before you can run it. You must automate any setup your test requires – even do not rely on the existence of database and pre-cooked data. Create an in-memory database, create schema and put dummy data and then test the code. In this way, you can run this test N number of times without fearing any external factor which can affect test execution and it’s result.

### Timely
- Practically, You can write unit tests at any time. You can wait up to code is production-ready or you’re better off focusing on writing unit tests in a timely fashion. As a suggestion, you should have guidelines or strict rules around unit testing. You can use review processes or even automated tools to reject code without sufficient tests. The more you unit-test, the more you’ll find that it pays to write smaller chunks of code before tackling a corresponding unit test. First, it’ll be easier to write the test, and second, the test will pay off immediately as you flesh out the rest of the behaviors in the surrounding code.

-----------------

