//
//  SuccessCheck.swift
//  SwiftSuccessCheckExaple
//
//  Created by Musaddiquie Husain on 18/08/17.
//  Copyright © 2017 MHusain. All rights reserved.
//

import UIKit

typealias SuccessCompletion = () -> Void

class SuccessCheck: UIView {
    
    var shouldSetupConstraints = true
    var movePoint: CGPoint!
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var secondEndPoint: CGPoint!
    var timer: Timer!
    var colorAlpha: Float = 0.0
    var completion: SuccessCompletion!
    var fillColor: UIColor!
    var strokeColor: UIColor!
    var tickWidth: CGFloat = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    override func draw(_ rect: CGRect) {
        let path1 = UIBezierPath()
        if endPoint.x == 0 && endPoint.y == 0 {
            path1.move(to: CGPoint(x: (frame.size.width * 32) / 100, y: (frame.size.width * 48) / 100))
            path1.addLine(to: CGPoint(x: (frame.size.width * 32) / 100, y: (frame.size.width * 48) / 100))
        }
        else {
            path1.move(to: CGPoint(x: (frame.size.width * 32) / 100, y: (frame.size.width * 48) / 100))
            path1.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
        }
        path1.lineWidth = tickWidth
        path1.lineCapStyle = .round
        strokeColor.setStroke()
        path1.stroke()
        
        if endPoint.x > (frame.size.width * 48) / 100 {
            let path2 = UIBezierPath()
            path2.move(to: CGPoint(x: ((frame.size.width * 49) / 100) + 1, y: ((frame.size.width * 65) / 100) + 1))
            if secondEndPoint.x == 0 && secondEndPoint.y == 0 {
                path2.addLine(to: CGPoint(x: ((frame.size.width * 49) / 100) + 1, y: ((frame.size.width * 65) / 100) + 1))
            }
            else {
                path2.addLine(to: CGPoint(x: secondEndPoint.x, y: secondEndPoint.y))
            }
            path2.lineWidth = tickWidth
            path2.lineCapStyle = .round
            strokeColor.setStroke()
            path2.stroke()
        }
    }
    
    func initWithTime(withDuration timerValue: Double, bgCcolor: UIColor, colorOfStroke: UIColor, widthOfTick: CGFloat, completionHandler successCompletion: @escaping () -> Void) {
        if (timer != nil) {
            timer.invalidate()
            timer = nil
        }
        strokeColor = colorOfStroke
        fillColor = bgCcolor
        backgroundColor = fillColor
        movePoint = CGPoint(x: (frame.size.width * 32)/100, y: (frame.size.width * 48)/100)
        startPoint = CGPoint(x: 2, y: 2)
        endPoint = CGPoint(x: 0, y: 0)
        secondEndPoint = CGPoint(x: 0, y: 0)
        completion = successCompletion
        alpha = 1.0
        tickWidth = widthOfTick
        timer = Timer.scheduledTimer(timeInterval: timerValue, target: self, selector: #selector(updateView(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func updateView(_ timerObject: Timer) {
        if (movePoint.y < (frame.size.width * 32)/100) {
            timer.invalidate()
            timer = nil
            UIView.animate(withDuration: 1.0, animations: {
                //do extra animation here
            }, completion: { (finished: Bool) in
                if self.completion != nil {
                    self.completion()
                }
            })
        }
        else {
            if (movePoint.x > (frame.size.width * 48)/100) {
                movePoint.x += 1.7
                movePoint.y -= startPoint.y
                updateSecondLine(withEnd: movePoint)
                setNeedsDisplay()
            }
            else {
                movePoint.x += startPoint.x
                movePoint.y += startPoint.y
                updatePoint(withMove: movePoint, withEnd: movePoint)
                setNeedsDisplay()
            }
        }
    }
    
    func updateSecondLine(withEnd second: CGPoint) {
        secondEndPoint = second
    }
    
    func updatePoint(withMove move: CGPoint, withEnd end: CGPoint) {
        endPoint = end
    }
    
}

