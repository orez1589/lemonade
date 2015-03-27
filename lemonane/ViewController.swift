//
//  ViewController.swift
//  lemonane
//
//  Created by Erez porat on 24/03/15.
//  Copyright (c) 2015 erez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentMoneyTextField: UITextField!
    @IBOutlet weak var currentLemonsTextField: UITextField!
    @IBOutlet weak var currentIceCubesTextField: UITextField!
    // labels of "step 1 " :
  
    @IBOutlet weak var labelNumberOfLemonsToBuy: UILabel!
    
    @IBOutlet weak var labelNumberOfIceCubesToBuy: UILabel!
    //text fields of "step 2 " : 
    
    @IBOutlet weak var labelNumberOfLemonToMix: UILabel!
    
    @IBOutlet weak var labelNumberOfIceCubesToMix: UILabel!
    
    // Some Varibles :
    var CurrentMoney    : Int = 10
    var CurrentLemons   :Int = 1
    var CurrentIceCubes :Int = 1
    var currentLemonMix : Int = 0
    var currentIceCubesToMix: Int = 0
    
    //number of presses : 
    var numberOfPress = 0 // plus or minus on the limon 
    var numberOfress2 = 0 // plus or minus on the ice cubes
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Purchase supplies :
    @IBAction func plusLemonsButtonPreseed(sender: UIButton) {
        
       if CurrentMoney >= 2
       {
        numberOfPress++
       labelNumberOfLemonsToBuy.text = String(numberOfPress)
        CurrentMoney -= 2
        CurrentLemons++
        currentMoneyTextField.text = "\(CurrentMoney)"
        currentLemonsTextField.text = "\(CurrentLemons)"
        }
       else {
        showError2()
        }
    }
    
    @IBAction func minusLemonsButtonPressed(sender: UIButton) {
       if CurrentLemons <= 1
       {
      
        showError() // cant be less then 0 !
       
        }
        else
       {
        numberOfPress--
        CurrentLemons--
        CurrentMoney += 2
        labelNumberOfLemonsToBuy.text = String(numberOfPress)
        currentLemonsTextField.text = "\(CurrentLemons)"
        currentMoneyTextField.text = "\(CurrentMoney)"
        
        }
    }
    
    @IBAction func plusIceCubesButtonPressed(sender: UIButton) {
        if CurrentMoney>0
        {
            numberOfress2++
            labelNumberOfIceCubesToBuy.text = String(numberOfress2)
        CurrentMoney--
            currentMoneyTextField.text = "\(CurrentMoney)"
        CurrentIceCubes++
        currentIceCubesTextField.text = "\(CurrentIceCubes)"
        }
        else
        {
            showError2()
        }
    }
    
    @IBAction func minusIceCubesButtonPressed(sender: UIButton) {
        
        if CurrentIceCubes <= 1
        {
            showError()
            println("can't be less then 1 ")
        }
        else {
            numberOfress2--
            CurrentMoney++
            CurrentIceCubes--
            labelNumberOfIceCubesToBuy.text = String(numberOfress2)
            currentIceCubesTextField.text = "\(CurrentIceCubes)"
            currentMoneyTextField.text = "\(CurrentMoney)"
        }
    }
    
    
    
    
    // Mix your lemonade :
    
    @IBAction func plusMixLemonsButtonPressed(sender: UIButton) {
        if CurrentLemons > 0
        {
            CurrentLemons--
        currentLemonMix++
            currentLemonsTextField.text = "\(CurrentLemons)"
          labelNumberOfLemonToMix.text = "\(currentLemonMix)"
        }
        else
        {
            showError()
        }
    }
    
    @IBAction func minusMixLemonsButtonPressed(sender: UIButton) {
        if currentLemonMix > 0  // אפשר להוריד את המספר הלימונים לערבב כאשר מספר הלימונים גדול מ- 0 וכאשר מספר הלימונים שרוצים לערבב גדול מ-0
        {
            
            currentLemonMix--
            CurrentLemons++
            currentLemonsTextField.text = "\(CurrentLemons)"
            labelNumberOfLemonToMix.text = "\(currentLemonMix)"
        }
        else
        {
          showError()
        }
    }
    
    @IBAction func plusMixIceCubesButtonPressed(sender: UIButton) {
        if CurrentIceCubes > 0
        {
            CurrentIceCubes--
            currentIceCubesToMix++
            currentIceCubesTextField.text = "\(CurrentIceCubes)"
            labelNumberOfIceCubesToMix.text = "\(currentIceCubesToMix)"
        }
        else
        {
            showError()
        }
    }
    
    @IBAction func minusMixIceButtonPressed(sender: UIButton) {
        if currentIceCubesToMix > 0
        {
            currentIceCubesToMix--
            CurrentIceCubes++
            currentIceCubesTextField.text = "\(CurrentIceCubes)"
            labelNumberOfIceCubesToMix.text = "\(currentIceCubesToMix)"
        }
        else
        {
        showError()
        }
        
    }
    
    func makeRatio () -> CGFloat
    {
        return  CGFloat(currentLemonMix) / CGFloat(currentIceCubesToMix) // יוצר רטיו בין הלימודה לקרח
    }
    func randomTasteBetweenZeroToOne () ->CGFloat
    {
        var randomNumber = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return randomNumber
        
    }

    @IBAction func startDayButtonPreseed(sender: UIButton) {
      

    var array1 : [Customer] = []
    // מערך ריק שמכיל משתנים מסוג לקוחות
    
    

   var randomNumberBetweebOneToTen = arc4random_uniform(UInt32(11))
    for var i = 0 ;   i < Int(randomNumberBetweebOneToTen) ; i++
    {
  var newCustomer = Customer ()
  newCustomer.taste = randomTasteBetweenZeroToOne()
  array1.append(newCustomer)
        
    }
    for var z = 0 ; z < array1.count  ; z++
    {
      if makeRatio() > 1 && array1[z].taste < 0.4
      {
        self.CurrentMoney++
        currentMoneyTextField.text = "\(CurrentMoney)"
        println("you earned 1 $ ")
        
    }
        else if makeRatio() == 1 && array1[z].taste > 0.4 && array1[z].taste < 0.7
      {
        self.CurrentMoney++
        currentMoneyTextField.text = "\(CurrentMoney)"

        println("you earned 1 $ ")
        }
     if makeRatio() == 1 && array1[z].taste == 1
     {
        CurrentMoney++
        currentMoneyTextField.text = "\(CurrentMoney)"

        println("you earned 1 $ ")
        }
        else
     {
        println("you didnt earn")
        }
        
        
    
    

        } // סוף פונקציית  יצירת לקוחות
     
      
    
        
        
      
        
        
        
        
    }
    // סוף פונקציה של התחלת יום
    
    func showError () // error if you try to make lemons under 1
    {
        let alert = UIAlertView()
        alert.title = "Error"
        alert.message = "Cant be less then 1 "
        alert.addButtonWithTitle("Dont")
        alert.show()
    }
    func showError2 ()
    
    // error if you try to buy things and you dont have money
    
    {
        let alert = UIAlertView()
        alert.title = "Error"
        alert.message = "You Don't have enough money  "
        alert.addButtonWithTitle("Dont")
        alert.show()
    }
    
    
    
   

    

}

