<img src="images/helios-logo.png" alt="Swift logo" height="128">

# Helios

A small library providing a set of Swift 5.1's Property Wrappers to be used with UIKit.

> NOTE: This library is under active development and the selection of property wrappers may change.

## Installation

Add this package to the Swift Packages list in your Xcode project settings. Alternatively add: `.package(url: "https://github.com/bobek-balinek/Helios.git", from: "0.1.0")`  to your `Package.swift` file.

## Available property wrappers

### @FixedSize

This property wrapper let's you quickly define, using AutoLayout width and height dimensions for a wrapped `UIView`.

```swift
class MyView: UIView {
	@FixedSize(50, 50, radius: 25)
	var thumbnailImage: UIImageView = UIImageView()

	// …
}
```

`@FixedSize` takes up to three arguments: `width: CGFloat`, `height: CGFloat`, and `radius: CGFloat`. You can define width-only, width and height, or width, height and additionally clip the corners with a given radius.

---

### @AspectRatio

This property wrapper let's you quickly define, using AutoLayout dimensions of a wrapped `UIView`, respecting given aspect ratio.

```swift
class MyView: UIView {
	@AspectRatio(4/3, radius: 15)
	var productImage: UIImageView = UIImageView()

	// …
}
```

`@AspectRatio` takes up to two arguments: `ratio: CGFloat` and `radius: CGFloat`. Radius can additionally clip the corners with a given radius.

---

### @RoundedCorners

`@RoundedCorners` clips the corners of a wrapped UIView with a given radius.

```swift
class MyView: UIView {
	@RoundedCorners(25)
	var thumbnailImage: UIImageView = UIImageView()

	// …
}
```

---

### @FontSize

`@FontSize` sets a system font of a given size on a wrapped `UILabel` instance. Additionally, you can set font weight and text color.

```swift
class MyView: UIView {
	@FontSize(24, weight: .bold, color: .red)
	var headingLabel: UILabel = UILabel()

	// …
}
```

---

### @TextStyle

`@TextStyle` configures wrapped `UILabel` to use dynamic font style and sets a given `UIFont.TextStyle`. Additionally, you can set text alignment, text color and font traits such as bold or italic.

```swift
class MyView: UIView {
	@TextStyle(.title1, color: .red, alignment: .center, fontTraits: [.bold])
	var headingLabel: UILabel = UILabel()

	// …
}
```

Hope you'll enjoy using Helios in your iOS apps!
