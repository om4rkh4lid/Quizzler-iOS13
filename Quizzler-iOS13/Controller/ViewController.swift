import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var quiz = Quiz()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let isAnswerRight = quiz.checkAnswer(userAnswer)
        
        
        if isAnswerRight {
            sender.backgroundColor = UIColor.green
            quiz.updateScore()
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quiz.updateQuestion()
        
        
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quiz.getQuestion()
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}

