//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let finalAnimal = getPopularAnimalByAnswers(answersChosen) {
            let animalEmoji: Character
            switch finalAnimal {
            case .dog:
                animalEmoji = "🐶"
            case .cat:
                animalEmoji = "🐱"
            case .rabbit:
                animalEmoji = "🐰"
            case .turtle:
                animalEmoji = "🐢"
            }
            resultLabel.text = "Вы - \(animalEmoji)"
            descriptionLabel.text = finalAnimal.definition
        }
        
        
    }
    
    private func getPopularAnimalByAnswers(_ answers: [Answer]) -> Animal? {
        let sortedAnswers = answers.sorted {
            itemA, itemB in itemA.animal != itemB.animal
         }
        
        if let animal = sortedAnswers.first?.animal {
            return animal
        }
        
        return nil
    }
}
