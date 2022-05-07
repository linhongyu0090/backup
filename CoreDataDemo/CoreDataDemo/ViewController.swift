//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 林宏宇 on 2022/4/13.
//

import UIKit

class ViewController: UIViewController {
    var items:[Person]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }

    func fetchPeople(){
        do{
            self.items = try context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                
            }
            
        }catch{
            
        }
    }

}

