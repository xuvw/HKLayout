//
//  UIView+HKLayoutExts.swift
//  HKLayout
//
//  Created by heke on 16/6/8.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

enum HKLayoutAttribute : Int {
    case Left
    case Right
    case Top
    case Bottom
    case Leading
    case Trailing
    case Width
    case Height
    case CenterX
    case CenterY
    case Baseline
    
    //扩展部分
    case origin
    case size
    case alFrame
    case inset
    case alCenter
}

extension UIView {
    //MARK:基本属性
    var left:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Left
            return layoutContainer
        }
    }
    var right:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Right
            return layoutContainer
        }
    }
    var top:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Top
            return layoutContainer
        }
    }
    var bottom:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Bottom
            return layoutContainer
        }
    }
    var leading:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Leading
            return layoutContainer
        }
    }
    var trailing:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Trailing
            return layoutContainer
        }
    }
    var width:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Width
            return layoutContainer
        }
    }
    var height:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Height
            return layoutContainer
        }
    }
    var centerX:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.CenterX
            return layoutContainer
        }
    }
    var centerY:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.CenterY
            return layoutContainer
        }
    }
    var baseLine:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.view1 = self
            layoutContainer.attribute1 = NSLayoutAttribute.Baseline
            return layoutContainer
        }
    }
    
    //MARK:扩展属性
    var origin:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.attribute1 = nil
            layoutContainer.view1 = self
            layoutContainer.hkLayoutAttribute = HKLayoutAttribute.origin
            return layoutContainer
        }
    }
    var size:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.attribute1 = nil
            layoutContainer.view1 = self
            layoutContainer.hkLayoutAttribute = HKLayoutAttribute.size
            return layoutContainer
        }
    }
    var alFrame:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.attribute1 = nil
            layoutContainer.view1 = self
            layoutContainer.hkLayoutAttribute = HKLayoutAttribute.alFrame
            return layoutContainer
        }
    }
    var inset:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.attribute1 = nil
            layoutContainer.view1 = self
            layoutContainer.hkLayoutAttribute = HKLayoutAttribute.inset
            return layoutContainer
        }
    }
    var alCenter:HKALContainer {
        get {
            let layoutContainer = HKALContainer()
            layoutContainer.attribute1 = nil
            layoutContainer.view1 = self
            layoutContainer.hkLayoutAttribute = HKLayoutAttribute.alCenter
            return layoutContainer
        }
    }
}

//MARK: class HKALContainer
class HKALContainer {
    
    var view1: UIView?
    var attribute1: NSLayoutAttribute?
    
    var view2: UIView?
    var attribute2: NSLayoutAttribute = NSLayoutAttribute.NotAnAttribute
    
    var hkLayoutAttribute: HKLayoutAttribute?
    
    var layouts = [NSLayoutConstraint]()
    var layout: NSLayoutConstraint?
    
    var relation = NSLayoutRelation.Equal
    var amultiplier: CGFloat = 1
    var aconstant: CGFloat = 0
    var apriority: UILayoutPriority = 1000
    
    //MARK: 组合操作
    //for origin or center
    func equalTo(point: CGPoint) ->HKALContainer {
        if hkLayoutAttribute == HKLayoutAttribute.origin {
            
            layouts.append(view1!.left.equalTo(view1!.superview!.left).offset(point.x).layout!)
            layouts.append(view1!.top.equalTo(view1!.superview!.top).offset(point.y).layout!)
            
        }else if hkLayoutAttribute == HKLayoutAttribute.alCenter {
            layouts.append(view1!.centerX.equalTo(view1!.superview!.centerX).offset(point.x).layout!)
            layouts.append(view1!.centerY.equalTo(view1!.superview!.centerY).offset(point.y).layout!)
        }
        
        return self
    }
    
    //for size
    func equalTo(size: CGSize) ->HKALContainer {
        layouts.append(view1!.width.equalTo(size.width).layout!)
        layouts.append(view1!.height.equalTo(size.height).layout!)
        return self
    }
    
    //for frame
    func equalTo(frame: CGRect) ->HKALContainer {
        layouts.appendContentsOf(view1!.origin.equalTo(frame.origin).layouts)
        layouts.appendContentsOf(view1!.size.equalTo(frame.size).layouts)
        return self
    }
    
    //for inset
    func equalTo(inset: UIEdgeInsets) ->HKALContainer {
        layouts.append(view1!.top.equalTo(view1!.superview!.top).offset(inset.top).layout!)
        layouts.append(view1!.left.equalTo(view1!.superview!.left).offset(inset.left).layout!)
        layouts.append(view1!.bottom.equalTo(view1!.superview!.bottom).offset(-1 * inset.bottom).layout!)
        layouts.append(view1!.right.equalTo(view1!.superview!.right).offset(-1 * inset.right).layout!)
        
        return self
    }
    
    //MARK: 基础操作
    func equalTo(value: CGFloat, amultiplier:CGFloat = 0) -> HKALContainer {
        self.amultiplier = 1
        createConstraint(NSLayoutRelation.Equal, valueOrView: value)
        return self
    }
    
    func lessThanOrEqualTo(value: CGFloat, amultiplier:CGFloat = 1) -> HKALContainer {
        self.amultiplier = amultiplier
        createConstraint(NSLayoutRelation.LessThanOrEqual, valueOrView: value)
        return self
    }
    
    func greaterThanOrEqualTo(value: CGFloat, amultiplier:CGFloat = 1) -> HKALContainer {
        self.amultiplier = amultiplier
        createConstraint(NSLayoutRelation.GreaterThanOrEqual, valueOrView: value)
        return self
    }
    
    //xxxxx
    func equalTo(valueOrView: HKALContainer, amultiplier:CGFloat = 1) -> HKALContainer {
        self.amultiplier = amultiplier
        if attribute1 != nil {
            createConstraint(NSLayoutRelation.Equal, valueOrView: valueOrView)
        }else {
            view2 = valueOrView.view1
            if view2 == nil || hkLayoutAttribute == nil {
                return self
            }
            
            switch hkLayoutAttribute! {
            case HKLayoutAttribute.origin:
                layouts.append(view1!.left.equalTo(view2!.left).layout!)
                layouts.append(view1!.top.equalTo(view2!.top).layout!)
                
            case HKLayoutAttribute.alCenter:
                layouts.append(view1!.centerX.equalTo(view2!.centerX).layout!)
                layouts.append(view1!.centerY.equalTo(view2!.centerY).layout!)
                
            case HKLayoutAttribute.size:
                layouts.append(view1!.width.equalTo(view2!.width).layout!)
                layouts.append(view1!.height.equalTo(view2!.height).layout!)
                
            case HKLayoutAttribute.alFrame:
                layouts.append(view1!.left.equalTo(view2!.left).layout!)
                layouts.append(view1!.top.equalTo(view2!.top).layout!)
                layouts.append(view1!.width.equalTo(view2!.width).layout!)
                layouts.append(view1!.height.equalTo(view2!.height).layout!)
                
            case HKLayoutAttribute.inset:
                layouts.append(view1!.left.equalTo(view2!.left).layout!)
                layouts.append(view1!.top.equalTo(view2!.top).layout!)
                layouts.append(view1!.bottom.equalTo(view2!.bottom).layout!)
                layouts.append(view1!.right.equalTo(view2!.right).layout!)
                
            default:
                print("param error")
            }
        }
        
        return self
    }
    
    func lessThanOrEqualTo(valueOrView: HKALContainer, amultiplier:CGFloat = 1) -> HKALContainer {
        self.amultiplier = amultiplier
        createConstraint(NSLayoutRelation.LessThanOrEqual, valueOrView: valueOrView)
        return self
    }
    
    func greaterThanOrEqualTo(valueOrView: HKALContainer, amultiplier:CGFloat = 1) -> HKALContainer {
        self.amultiplier = amultiplier
        createConstraint(NSLayoutRelation.GreaterThanOrEqual, valueOrView: valueOrView)
        return self
    }
    
    //MARK: make constaint:
    func createConstraint(relation: NSLayoutRelation, valueOrView: AnyObject) {
        
        view1?.translatesAutoresizingMaskIntoConstraints = false
        view2?.translatesAutoresizingMaskIntoConstraints = false
        
        if valueOrView is CGFloat {
            self.aconstant = valueOrView as! CGFloat
            self.view2 = nil
            self.attribute2 = NSLayoutAttribute.NotAnAttribute
        }else if valueOrView is HKALContainer {
            self.view2 = (valueOrView as! HKALContainer).view1
            self.attribute2 = (valueOrView as! HKALContainer).attribute1!
        }else {
            self.view2 = nil
            self.attribute2 = NSLayoutAttribute.NotAnAttribute
            print("####HKALContainer:param Type error, must be a CGFloat or HKALContainer####")
        }
        
        self.relation = relation
        layout = NSLayoutConstraint(item: view1!,
                                    attribute:attribute1!,
                                    
                                    relatedBy: self.relation,
                                    
                                    toItem: view2,
                                    attribute: attribute2,
                                    
                                    multiplier: amultiplier,
                                    
                                    constant: aconstant)
        layouts.append(layout!)
        installLayout()
    }
    
    func offset(offset: CGFloat = 0) ->HKALContainer {
        layout?.constant = offset
        return self
    }
    
    func priority(p: UILayoutPriority = 1000) ->HKALContainer {
        layout?.priority = p
        return self
    }
    
    func installLayout() {
        if view2 == nil {
            
            view1?.addConstraint(layout!)
        }else {
            
            let commonSuperView = HKALContainer.closestCommonSuperviewFromView(view1, toView: view2)
            if commonSuperView != nil {
                commonSuperView?.addConstraint(layout!)
            }else {
                print("####HKALContainer get error view1 or view2 do not have common superView, fix it")
            }
        }
    }
    
    static func closestCommonSuperviewFromView(fromView: UIView?, toView: UIView?) -> UIView? {
        var views = Set<UIView>()
        var fromView = fromView
        var toView = toView
        repeat {
            if let view = toView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                toView = view.superview
            }
            if let view = fromView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                fromView = view.superview
            }
        } while (fromView != nil || toView != nil)
        
        return nil
    }
}