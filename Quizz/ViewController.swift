//
//  ViewController.swift
//  Quizz
//
//  Created by m2sar on 10/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var nbrep:Int=0;
    var questRep=QuestionsReponses()
    
    
    @IBOutlet weak var switchBD: UISwitch!
    
    @IBOutlet weak var numberReponseLabel: UILabel!
    
    @IBOutlet weak var questionTextView: UITextView!

    @IBOutlet weak var reponseTextView: UITextView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberReponseLabel.text = "\(nbrep)"
        switchBD.on = false
        
        var str = questRep.getNextQuestionNml()
        reponseTextView.text = ""
        questionTextView.text = str
        questionTextView.textColor = UIColor.blueColor()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextAction(sender: AnyObject) {
        var str:String!
        if switchBD.on {
            str = questRep.getNextQuestionBal()
            if str != nil {
                if questRep.isBalaise(questRep.count){
                    questionTextView.textColor = UIColor.redColor()
                }else {
                    questionTextView.textColor = UIColor.blueColor()
                }
                
                questionTextView.text = str
                reponseTextView.text = ""
                if questRep.isView(questRep.count) {
                    reponseTextView.text = questRep.reponse(questRep.count)
                }
            }
        } else {
            str = questRep.getNextQuestionNml()
            if str != nil {
                questionTextView.text = str
                questionTextView.textColor = UIColor.blueColor()
                reponseTextView.text = ""
                if questRep.isView(questRep.count) {
                    reponseTextView.text = questRep.reponse(questRep.count)
                }
            }
        }
    }
    
    
    
    @IBAction func previousAction(sender: AnyObject) {
        var str:String!
        if switchBD.on {
            str = questRep.getPrevQuestionBal()
            if str != nil {
                if questRep.isBalaise(questRep.count){
                    questionTextView.textColor = UIColor.redColor()
                }else {
                    questionTextView.textColor = UIColor.blueColor()
                }
                questionTextView.text=str
                reponseTextView.text = ""
                if questRep.isView(questRep.count) {
                    reponseTextView.text = questRep.reponse(questRep.count)
                }
            }
        } else {
            str = questRep.getPrevQuestionNml()
            if str != nil {
                questionTextView.text=str
                questionTextView.textColor = UIColor.blueColor()
                reponseTextView.text = ""
                if questRep.isView(questRep.count) {
                    reponseTextView.text = questRep.reponse(questRep.count)
                }
            }
        }
    }
    
    
    
    @IBAction func reponseButtom(sender: AnyObject) {
        if !questRep.isView(questRep.count) {
             nbrep++
        }
       
        numberReponseLabel.text = String(nbrep)
        questRep.makeView(questRep.count)
        reponseTextView.text = questRep.reponse(questRep.count)
        
    }
    
    
    @IBAction func switchBDAction(sender: AnyObject) {
        if !switchBD.on {
            var str = questRep.getNextQuestionNml()
            reponseTextView.text = ""
            questionTextView.text = str
            questionTextView.textColor = UIColor.blueColor()
            if questRep.isView(questRep.count) {
                reponseTextView.text = questRep.reponse(questRep.count)
            }
            
        }
        
    }
}
