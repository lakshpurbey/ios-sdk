//
//  MyTransition.swift
//  TelerikUIExamplesInSwift
//
//  Copyright (c) 2015 Telerik. All rights reserved.
//

class MyTransition: TKSideDrawerTransition {
    
    var isAnimating = false;
    var sideDrawerIdentityCenter = CGPointZero
    var hostviewIdentityCenter = CGPointZero
    
    override func show() {
        if !self.sideDrawer!.isVisible {
            self.sideDrawer!.frame = CGRectMake(0, -self.sideDrawer!.superview!.bounds.size.height, self.sideDrawer!.width, self.sideDrawer!.superview!.bounds.size.height)
            sideDrawerIdentityCenter = self.sideDrawer!.center
            hostviewIdentityCenter = self.sideDrawer!.hostview!.center
        }
        
        self.transitionBegan(true);
        UIView.animateWithDuration(Double(self.sideDrawer!.transitionDuration),
            animations: {
                self.sideDrawer!.center = CGPointMake(self.sideDrawerIdentityCenter.x, self.sideDrawerIdentityCenter.y + self.sideDrawer!.bounds.size.height)
                self.sideDrawer!.hostview!.center = CGPointMake(self.hostviewIdentityCenter.x + self.sideDrawer!.width, self.hostviewIdentityCenter.y)
            },
            completion: {
                (finished) -> Void in
                self.transitionEnded(true)
        })
        

    }
    
    override func dismiss() {
        self.transitionBegan(false)
        UIView.animateWithDuration(Double(self.sideDrawer!.transitionDuration),
            animations: {
                self.sideDrawer!.center = CGPoint(x: self.sideDrawer!.width / 2.0, y: -self.sideDrawer!.frame.size.height / 2.0);
                self.sideDrawer!.hostview!.center = CGPoint(x: CGRectGetMidX(self.sideDrawer!.hostview!.superview!.bounds),
                    y: CGRectGetMidY(self.sideDrawer!.hostview!.superview!.bounds));
            },
            completion: {
                (finished) -> Void in
                self.transitionEnded(false)
        })
    }
    
    override func transitionBegan(showing: Bool) {
        isAnimating = true
        if showing {
            self.sideDrawer!.hidden = false
            self.sideDrawer!.hostview!.userInteractionEnabled = false
            self.sideDrawer!.superview!.bringSubviewToFront(self.sideDrawer!.hostview!)
        }
    }
    
    override func transitionEnded(showing: Bool) {
        isAnimating = false
        if !showing {
            self.sideDrawer!.hidden = true
            self.sideDrawer!.hostview!.userInteractionEnabled = true
            if self.sideDrawer!.delegate != nil && self.sideDrawer!.delegate!.respondsToSelector(#selector(TKSideDrawerDelegate.didDismissSideDrawer(_:))) {
                self.sideDrawer!.delegate!.didDismissSideDrawer!(self.sideDrawer)
            }
        }
        else {
            if self.sideDrawer!.delegate != nil && self.sideDrawer!.delegate!.respondsToSelector(#selector(TKSideDrawerDelegate.didShowSideDrawer(_:))) {
                self.sideDrawer!.delegate!.didShowSideDrawer!(self.sideDrawer)
            }
        }
    }
}
