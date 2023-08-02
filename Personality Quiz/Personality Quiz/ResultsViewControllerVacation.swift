//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Oquba Khan on 7/30/23.
//

import UIKit

class ResultsViewControllerVacation: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefintionLabel: UILabel!

    
    var responses: [AnswerV]!
    
    init?(coder: NSCoder, responses: [AnswerV]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResults() {
        let frequencyOfAnswers = responses.reduce(into:[VacationType:Int]()) {
            (counts, answer) in if let existingCount = counts[answer.type] {
                counts[answer.type, default:0] += 1
            } else {
                counts[answer.type] = 1
            }
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
                                                                { (pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "Visit \(mostCommonAnswer.rawValue)!"
        resultDefintionLabel.text = mostCommonAnswer.definition
    }
    
    
    /*{
    cat : 1,
    dog : 2,
    rabbit : 1,
    turtle : 1
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
