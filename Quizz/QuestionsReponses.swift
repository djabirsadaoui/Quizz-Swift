//
//  QuestionsReponses.swift
//  Quizz
//
//  Created by m2sar on 10/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import Foundation

 class QuestionsReponses {
    
    var taille:Int=0
    var count:Int
    
    var Qtab=[("Le suffrage universel pour l'élection du Président de la République date de" , "1962" ,0,false),
        ("Dans l'expression CAC que veut dire l'abréviation CAC" , "cotation assistée en continu" , 1,false),
        ("Qui est l'actuel roi du Maroc ?" , "Mohammed VI" , 0,false),
        ("A quel organisme dont les initiales sont indiquées ci-dessous a été confiée la gestion des déchets radioactifs ?" , "ANDRA" , 1,false),
        ("Qui a été champion du monde de formule 1 en 2001" ,"Michaël Schumacher" , 0,false),
        ("Quand a été créée l'ONU ?" , "1945" , 1,false),
        ("La France a gardé une dizaine de possessions outre-mer, parmi celles-ci lesquelles sont des TOM?" , "Polynésie française et Wallis et Futuna" , 0,false),
        ("Parmi ces régions françaises quelle est celle dont la population est la plus faible ?" , "Limousin" , 0,false),
        ("De quel département la ville de Blois est-elle le chef-lieu ?" , "le Loir-et-Cher" , 0,false),
        ("Que signifie les initiales CNC ?" , "centre national de cinématographie" , 0,false),
        ("En 2001, quel sportif français a été nommé (champion de l'UNESCO) pour la 0,50 jeunesse?" , "David Douillet" , 1,false),
        ("Depuis la loi dite (Chevènement) de 1999, quel est le nouveau type d'établissement public de coopération intercommunal?" , "la communauté d'agglomération" , 0,false),
        ("Quel est le nom de l'actuel président du parlement européen?" , "Pat Cox" , 0,false),
        ("La première femme ministre de la défense ?", "Michèle Alliot Marie" , 1,false),
        ("Quelle est l'institution chargée d'établir l'avant-projet de budget de la communauté européenne", "la commission européenne" , 0,false)]
    
    
    init (){
        count = -1
        for p in Qtab {
            self.taille++
        }
    }
    
    func question (ind : Int) -> String {
        return Qtab[ind].0
    }
    
    func reponse(ind : Int) -> String{
        Qtab[ind].3 = true
        return Qtab[ind].1
        
    }

 
    
    func isView(ind :Int) -> Bool {
        return Qtab[ind].3
    }
    
    func makeView(ind :Int) {
        Qtab[ind].3 = true
    }
    
    
    func isBalaise(ind :Int) -> Bool {
        
        if Qtab[ind].2 == 1 {
            return true
        } else {
            return false
        }
    }
    
    func getNextQuestionNml() ->String {
        
        var str:String = ""
        
        count++
        
        if count == taille {
            count=0
        }
        
        while(count < taille) {
            if !isBalaise(count) {
                str=Qtab[count].0
                break
            }
           
            count++
            if count == taille {
                count=0
            }
        }
        
        
            return str
        
    }
    
    
    func getPrevQuestionNml() ->String {
        

        var str:String = ""
        count--
        
        if count < 0 {
            count = taille-1
        }
        
        while (count>=0)  {
            if !isBalaise(count){
                str=Qtab[count].0
                break
            }
            count--
            
            if count < 0 {
                count = taille-1
            }


            
        }
        
    
            return str
        
    }
    
    
    
    
    func getNextQuestionBal() ->String {
        
        var str:String = ""
        count++
        
            if count == taille {
                count=0
            }
        
        
            str=Qtab[count].0
            return str

        
    }
    
    func getPrevQuestionBal() ->String {
        
        var str:String = ""
        count--
        
        if count < 0  {
            count = taille-1
        }
        
            str=Qtab[count].0
            return str
     
    }
    
}
