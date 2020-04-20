//
//  ViewController.swift
//  SwiftSuccessCheckExaple
//
//  Created by Musaddiquie Husain on 18/08/17.
//  Copyright © 2017 MHusain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var successCheckView: UIView!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var shapeSegment: UISegmentedControl!
    var scView: SuccessCheck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //add a target on slider
        durationSlider.addTarget(self, action: #selector(onDurationChange), for: .valueChanged)
        //add success check view
        scView = SuccessCheck(frame: successCheckView.bounds)
        //play animation
        playSuccessCheck(withDuration: Double(durationSlider.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //callback called when duration value change
    @objc func onDurationChange(){
        scView.removeFromSuperview()
        playSuccessCheck(withDuration: Double(durationSlider.value))
    }
    
    func playSuccessCheck(withDuration duration: Double) {
        successCheckView.addSubview(scView)
        lblStatus.text = "Animating..."
        lblStatus.textColor = .green
        scView.initWithTime(withDuration: duration, bgCcolor: .orange, colorOfStroke: .white, widthOfTick: 5) {
            //do additional work after completion
            self.lblStatus.text = "Completed"
            self.lblStatus.textColor = .orange
        }
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl)
    {
        switch shapeSegment.selectedSegmentIndex {
            case 0://square
                successCheckView.layer.cornerRadius = 0
                break
            default://circle
                successCheckView.layer.cornerRadius = successCheckView.frame.size.width / 2
                break
        }
        successCheckView.layer.masksToBounds = true
        playSuccessCheck(withDuration: Double(durationSlider.value))
    }
    
}

