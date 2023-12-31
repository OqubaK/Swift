//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Oquba Khan on 7/30/23.
//

import UIKit

class QuestionViewControllerVacation: UIViewController {
    @IBOutlet var questionLabel: UILabel!

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    var answerChosen: [AnswerV] = []
    
    var questions: [QuestionV] = [
        QuestionV(
            text: "What do you want to do??",
            type: .single,
            answers: [
                AnswerV(text: "See city", type: .NewYork),
                AnswerV(text: "See nature", type: .Vancouver),
                AnswerV(text: "See a foreign city", type: .Paris),
                AnswerV(text: "Go shopping", type: .Dubai)
            ]
        ),
        QuestionV(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                AnswerV(text: "Exploring", type: .NewYork),
                AnswerV(text: "Walking", type: .Vancouver),
                AnswerV(text: "Sight-seeing", type: .Paris),
                AnswerV(text: "Trying new food", type: .Dubai)
            ]
        ),
        QuestionV(
            text: "Can you withstand heat?",
            type: .ranged,
            answers: [
                AnswerV(text: "I don't mind it", type: .NewYork),
                AnswerV(text: "I can't stand it", type: .Vancouver),
                AnswerV(text: "I get a little nervous", type: .Paris),
                AnswerV(text: "I can't stand it", type: .Dubai)
            ]
        )
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [AnswerV]) {
        singleStackView.isHidden = false
        
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [AnswerV]) {
        multipleStackView.isHidden = false
        
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [AnswerV]) {
        rangedStackView.isHidden = false
        
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswers[0])
            nextQuestion()
            
        case singleButton2:
            answerChosen.append(currentAnswers[1])
            nextQuestion()
            
        case singleButton3:
            answerChosen.append(currentAnswers[2])
            nextQuestion()
            
        case singleButton4:
            answerChosen.append(currentAnswers[3])
            nextQuestion()
            
        default:
            break
        }
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
        
    }
    
    @IBOutlet var rangedSlider: UISlider!
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewControllerVacation
            resultsViewController.responses = answerChosen
        }
    }
                
    
    /*@IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answerChosen)*/
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
