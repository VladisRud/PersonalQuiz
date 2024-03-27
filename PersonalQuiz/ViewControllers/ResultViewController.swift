//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer] = []

    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        addTextToLabels()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

private extension ResultViewController {
    func getQuizResult() -> Animal {
        var userAnimal: Animal = .cat
        var dictCheck: [Animal:Int] = [:]
        var max = 0
        
        answers.forEach { animal in
            if let count = dictCheck[animal.animal] {
                dictCheck[animal.animal] = count + 1
            } else {
                dictCheck[animal.animal] = 1
            }
        }
        
        for(animal, count) in dictCheck {
            if count > max {
                max = count
                userAnimal = animal
            }
        }
        
        return userAnimal
    }
    
    func addTextToLabels() {
        let animal = getQuizResult()
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
    
}
