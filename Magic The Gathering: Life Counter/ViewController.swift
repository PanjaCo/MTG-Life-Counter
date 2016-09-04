//
//  ViewController.swift
//  Magic The Gathering: Life Counter
//
//  Created by Panja on 7/10/16.
//  Copyright © 2016 Panja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var oneHealthLabel: UILabel!
    @IBOutlet weak var twoHealthLabel: UILabel!
    
    @IBOutlet weak var onePlusButton: UIImageView!
    @IBOutlet weak var oneMinusButton: UIImageView!
    @IBOutlet weak var twoPlusButton: UIImageView!
    @IBOutlet weak var twoMinusButton: UIImageView!
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var rollDiceButton: UIButton!
    @IBOutlet weak var selectLivesButton: UIButton!
    @IBOutlet weak var openSettingsButton: UIButton!
    
    @IBOutlet weak var twentyHealthSelect: UIButton!
    @IBOutlet weak var thirtyHealthSelect: UIButton!
    @IBOutlet weak var fourtyHealthSelect: UIButton!
    
    @IBOutlet weak var onePoison: UISlider!
    @IBOutlet weak var twoPoison: UISlider!
    
    @IBOutlet weak var onePoisonLabel: UILabel!
    @IBOutlet weak var twoPoisonLabel: UILabel!
    
    @IBOutlet weak var oneDiceRollImage: UIImageView!
    
    @IBOutlet weak var twoDiceRollImage: UIImageView!
    
    
    var oneHealth = 20;
    var twoHealth = 20;
    
    var oneHealthS: String = "20";
    var twoHealthS: String = "20";
    
    var livesPreset: Int = 20;
    
    var livesSelectionArray: [UIButton] = [];
    var mainSelectionArray: [UIButton] = [];
    
    var numberOfRolls: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Rotate Text
        oneHealthLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) / -1);
        
        //Setup arrays
        livesSelectionArray.append(twentyHealthSelect);
        livesSelectionArray.append(thirtyHealthSelect);
        livesSelectionArray.append(fourtyHealthSelect);
        
        mainSelectionArray.append(restartButton);
        mainSelectionArray.append(rollDiceButton);
        mainSelectionArray.append(selectLivesButton);
        mainSelectionArray.append(openSettingsButton);
        
        oneDiceRollImage.hidden = true;
        twoDiceRollImage.hidden = true;
        
        //Grab saved values from previous session
        
        
        //Hide correct objects
        for(var x = 0; x < livesSelectionArray.count; x += 1){
            livesSelectionArray[x].hidden = true;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Add/Sub a health point from Player One
    func plusOne(){
        oneHealth += 1;
        oneHealthS = String(oneHealth)
        oneHealthLabel.text = oneHealthS;
        if(oneHealth <= 0){
            //Set the label color to red
            oneHealthLabel.textColor = UIColor.redColor();
        }else{
            //Set the label color back to white
            oneHealthLabel.textColor = UIColor.whiteColor()
        }
    }
    func minusOne(){
        oneHealth -= 1;
        oneHealthS = String(oneHealth)
        oneHealthLabel.text = oneHealthS;
        if(oneHealth <= 0){
            oneHealthLabel.textColor = UIColor.redColor()
        }else{
            oneHealthLabel.textColor = UIColor.whiteColor()
        }
    }
    //Add/Sub a health point from Player Two
    func plusTwo(){
        twoHealth += 1;
        twoHealthS = String(twoHealth)
        twoHealthLabel.text = twoHealthS;
        if(twoHealth <= 0){
            twoHealthLabel.textColor = UIColor.redColor()
        }else{
            twoHealthLabel.textColor = UIColor.whiteColor()
        }
    }
    func minusTwo(){
        twoHealth -= 1;
        twoHealthS = String(twoHealth)
        twoHealthLabel.text = twoHealthS;
        if(twoHealth <= 0){
            twoHealthLabel.textColor = UIColor.redColor()
        }else{
            twoHealthLabel.textColor = UIColor.whiteColor()
        }
    }

    
    @IBAction func onPlusOne(sender: AnyObject) {
        plusOne()
    }
    @IBAction func onMinusOne(sender: AnyObject) {
        minusOne()
    }
    
    @IBAction func onPlusTwo(sender: AnyObject) {
        plusTwo()
    }
    @IBAction func onMinusTwo(sender: AnyObject) {
        minusTwo()
    }
    
    @IBAction func onSelectLives(sender: AnyObject) {
        for(var x = 0; x < livesSelectionArray.count; x += 1){
            livesSelectionArray[x].hidden = false;
        }
        for(var x = 0; x < mainSelectionArray.count; x += 1){
            mainSelectionArray[x].hidden = true;
        }
    }
    
    @IBAction func onSelectTwentyLives(sender: AnyObject) {
        oneHealth = 20;
        oneHealthS = "20"
        oneHealthLabel.text = oneHealthS;
        twoHealth = 20;
        twoHealthS = "20"
        twoHealthLabel.text = twoHealthS;
        for(var x = 0; x < livesSelectionArray.count; x += 1){
            livesSelectionArray[x].hidden = true;
        }
        for(var x = 0; x < mainSelectionArray.count; x += 1){
            mainSelectionArray[x].hidden = false;
        }
        livesPreset = 20;
    }
    @IBAction func onSelectThirtyLives(sender: AnyObject) {
        oneHealth = 30;
        oneHealthS = "30"
        oneHealthLabel.text = oneHealthS;
        twoHealth = 30;
        twoHealthS = "30"
        twoHealthLabel.text = twoHealthS;
        for(var x = 0; x < livesSelectionArray.count; x += 1){
            livesSelectionArray[x].hidden = true;
        }
        for(var x = 0; x < mainSelectionArray.count; x += 1){
            mainSelectionArray[x].hidden = false;
        }
        livesPreset = 30;
    }
    @IBAction func onSelectFourtyLives(sender: AnyObject) {
        oneHealth = 40;
        oneHealthS = "40"
        oneHealthLabel.text = oneHealthS;
        twoHealth = 40;
        twoHealthS = "40"
        twoHealthLabel.text = twoHealthS;
        for(var x = 0; x < livesSelectionArray.count; x += 1){
            livesSelectionArray[x].hidden = true;
        }
        for(var x = 0; x < mainSelectionArray.count; x += 1){
            mainSelectionArray[x].hidden = false;
        }
        livesPreset = 40;
    }
    
    @IBAction func onReset(sender: AnyObject) {
        oneHealth = livesPreset;
        oneHealthS = String(oneHealth);
        oneHealthLabel.text = oneHealthS;
        twoHealth = livesPreset;
        twoHealthS = String(twoHealth);
        twoHealthLabel.text = twoHealthS;
        onePoison.setValue(0, animated: true);
        onePoisonLabel.text = "0";
        twoPoison.setValue(0, animated: true);
        twoPoisonLabel.text = "0";
    }
    
    @IBAction func onePoisonUpdate(sender: AnyObject) {
        var rounded = String(round(onePoison.value));
        var splitArray = rounded.characters.split(".");
        onePoisonLabel.text = (String(splitArray[0]));
    }
    
    @IBAction func twoPoisonUpdate(sender: AnyObject) {
        var rounded = String(round(twoPoison.value));
        var splitArray = rounded.characters.split(".");
        twoPoisonLabel.text = (String(splitArray[0]));
    }

    func hidePlayers(bool: Bool){
        oneHealthLabel.hidden = bool;
        onePoison.hidden = bool;
        onePoisonLabel.hidden = bool;
        onePlusButton.hidden = bool;
        oneMinusButton.hidden = bool;
        
        twoHealthLabel.hidden = bool;
        twoPoison.hidden = bool;
        twoPoisonLabel.hidden = bool;
        twoPlusButton.hidden = bool;
        twoMinusButton.hidden = bool;
    }
    
    @IBAction func onDiceRoll(sender: AnyObject) {
        hidePlayers(true);
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "getRandomRoll", userInfo: nil, repeats: false);
        
    }
    
    func getRandomRoll(){
        oneDiceRollImage.hidden = false;
        twoDiceRollImage.hidden = false;
        if(numberOfRolls == 15){
            
            numberOfRolls = 0
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "resumeAfterDiceRoll", userInfo: nil, repeats: false);
            
            
        }else{
            
            var dice1 = arc4random_uniform(6) + 1;
            var image = "notSelected"
            if(dice1 == 1){
                image = "diceOne.png";
            }else if(dice1 == 2){
                image = "diceTwo.png";
            }else if(dice1 == 3){
                image = "diceThree.png";
            }else if(dice1 == 4){
                image = "diceFour.png";
            }else if(dice1 == 5){
                image = "diceFive.png";
            }else if(dice1 == 6){
                image = "diceSix.png";
            }else{
                print("Error occured: dice1 != anything between 1 and 6");
            }
            
            oneDiceRollImage.image = UIImage(named: image);
            
            //Roll for player two
            dice1 = arc4random_uniform(6) + 1;
            image = "notSelected"
            if(dice1 == 1){
                image = "diceOne.png";
            }else if(dice1 == 2){
                image = "diceTwo.png";
            }else if(dice1 == 3){
                image = "diceThree.png";
            }else if(dice1 == 4){
                image = "diceFour.png";
            }else if(dice1 == 5){
                image = "diceFive.png";
            }else if(dice1 == 6){
                image = "diceSix.png";
            }else{
                print("Error occured: dice1 != anything between 1 and 6 -- Player 2");
            }
            
            twoDiceRollImage.image = UIImage(named: image);
            
            numberOfRolls += 1;
            
            if(numberOfRolls <= 10){
                NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "getRandomRoll", userInfo: nil, repeats: false);
            }else if(numberOfRolls <= 13){
                NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "getRandomRoll", userInfo: nil, repeats: false);
            }else{
                NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: "getRandomRoll", userInfo: nil, repeats: false);
            }

        }
    }
    
    func unHidePlayers(){
        hidePlayers(false);
    }
    
    func resumeAfterDiceRoll(){
        oneDiceRollImage.hidden = true;
        twoDiceRollImage.hidden = true;
        hidePlayers(false);
    }
    
    
}

