//
//  ViewController.swift
//  EstSwiftIndoorYouTube
//
//  Created by Michael Kane on 3/23/15.
//  Copyright (c) 2015 ArilogicApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ESTIndoorLocationManagerDelegate {

    @IBOutlet var myLocationView: ESTIndoorLocationView!
    @IBOutlet var myPositionLabel: UILabel!
    
    let manager : ESTIndoorLocationManager = ESTIndoorLocationManager()
    var location : ESTLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the path to our JSON file
        
        var path = NSBundle.mainBundle().pathForResource("location", ofType: "json")
        var content = NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil) as String
        
        let locationSetup = ESTLocationBuilder.parseFromJSON(content)
        
        //set up our delegate
        manager.delegate = self
        
        //set up location
        location = locationSetup

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //set up properties of location view
    override func viewWillAppear(animated: Bool) {
        
        myLocationView.backgroundColor = UIColor.clearColor()
        myLocationView.showTrace = true
        myLocationView.showWallLengthLabels = true
        myLocationView.rotateOnPositionUpdate = false
        
        myLocationView.locationBorderColor = UIColor.blackColor()
        myLocationView.locationBorderThickness = 6
        myLocationView.doorColor = UIColor.brownColor()
        myLocationView.doorThickness = 5
        myLocationView.traceColor = UIColor.yellowColor()
        myLocationView.traceThickness = 2
        myLocationView.wallLengthLabelsColor = UIColor.blackColor()
        
        //start location drawing
        myLocationView.drawLocation(location)
        manager.startIndoorLocation(location)
    }
    
    //stop listening for the view
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        manager.stopIndoorLocation()
    }

    //check for failure
    func indoorLocationManager(manager: ESTIndoorLocationManager!, didFailToUpdatePositionWithError error: NSError!) {
        println("Did Fail to update location \(manager)")
    }

    //updating our label, and updating our position
    func indoorLocationManager(manager: ESTIndoorLocationManager!, didUpdatePosition position: ESTOrientedPoint!, inLocation location: ESTLocation!) {
        
        myPositionLabel.text = NSString(format: "x: %.2f   y: %.2f    α: %.2f",
            position.x,
            position.y,
            position.orientation)
        
        
        myLocationView.updatePosition(position)
    }

}

