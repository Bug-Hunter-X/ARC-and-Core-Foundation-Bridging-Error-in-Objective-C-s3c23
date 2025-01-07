The solution involves using `__bridge_transfer` instead of `__bridge`. `__bridge_transfer` transfers ownership of the Core Foundation object to ARC.  Here's the corrected code:

```objectivec
CFStringRef cfString = CFStringCreateWithCString(kCFAllocatorDefault, "Hello, world!", kCFStringEncodingUTF8);
NSString *nsString = (__bridge_transfer NSString *)cfString;
// ... some operations with nsString ...
// CFRelease(cfString); // No longer needed
```

By using `__bridge_transfer`, ARC takes ownership of the `NSString` object, and the `CFRelease` call is no longer necessary. This prevents the crash by ensuring the object's memory is managed correctly.