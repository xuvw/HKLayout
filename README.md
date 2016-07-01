# HKLayout
用Swift封装的自动布局工具

```swift
   view1.width.equalTo(view1.height)
   view1.height.equalTo(view.width,amultiplier: 0.1)
   view1.top.equalTo(view.top).offset(100)
   view1.centerX.equalTo(view.centerX)
```

```swift
   scrollView.inset.equalTo(UIEdgeInsetsMake(220, 0, 0, 0))
   contentView.inset.equalTo(scrollView.inset)
   contentView.width.equalTo(scrollView.width)
   label1.inset.equalTo(UIEdgeInsetsMake(10, 10, 10, 10))
```
