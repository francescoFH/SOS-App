//
//  UIView+Extensions.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import UIKit

extension UIView {
  func lock() {
    if let _ = viewWithTag(10) {
      //View is already locked
    }
    else {
      let lockView = UIView(frame: bounds)
      lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
      lockView.tag = 10
      lockView.alpha = 0.0
      let activity = UIActivityIndicatorView(style: .medium)
      activity.color = .white
      activity.hidesWhenStopped = true
      activity.center = lockView.center
      lockView.addSubview(activity)
      activity.startAnimating()
      addSubview(lockView)
      
      UIView.animate(withDuration: 0.2) {
        lockView.alpha = 1.0
      }
    }
  }
  
  func unlock() {
    if let lockView = viewWithTag(10) {
      UIView.animate(withDuration: 0.2, animations: {
        lockView.alpha = 0.0
      }, completion: { finished in
        lockView.removeFromSuperview()
      })
    }
  }
  
  func fadeOut(_ duration: TimeInterval) {
    UIView.animate(withDuration: duration) {
      self.alpha = 0.0
    }
  }
  
  func fadeIn(_ duration: TimeInterval) {
    UIView.animate(withDuration: duration) {
      self.alpha = 1.0
    }
  }
  
  class func viewFromNibName(_ name: String) -> UIView? {
    let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
    return views?.first as? UIView
  }
}


