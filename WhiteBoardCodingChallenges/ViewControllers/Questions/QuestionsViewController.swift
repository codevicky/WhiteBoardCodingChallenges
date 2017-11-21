//
//  QuestionsViewController.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

// MARK: - Enum

enum QuestionType: Int {
    
    case stringReversalA
    case stringReversalB
    case stringReversalWithWordOrderingPerserved
    case sortByAlpabeticalOrder
    case convertDecimalToBinary
    case palindrome
    case findGCD
    case determineIfPrime
    case generatePrimes
    case powerOf2
    case commonCharacters
    case buzzFizz
    
    static let count: Int = {
        
        var max: Int = 0
        while let _ = QuestionType(rawValue: max) {
            
            max += 1
        }
        
        return max
    }()
    
    
}

class QuestionsViewController: UIViewController {
    
    // MARK: Constants
    
    fileprivate static let kQuestionCellIdentifier = "kQuestionCellIdentifier"
    
    // MARK: - InstanceVariables
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /*----------------*/
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: QuestionsViewController.kQuestionCellIdentifier)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("segue: \(segue), sender: \(sender)")
        
        guard let indexPath = sender as? IndexPath else {
            return
        }
        
        let viewController = segue.destination as! SingleTextFieldViewController
        
        viewController.questionType = QuestionType.init(rawValue: indexPath.row)
    }
}

// MARK: - UITableViewDelegate

extension QuestionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "QuestionSelected", sender: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension QuestionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return QuestionType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionsViewController.kQuestionCellIdentifier, for: indexPath)
        
        switch indexPath.row {
        case QuestionType.stringReversalA.rawValue:
            cell.textLabel?.text = "Reverse String A"
        case QuestionType.stringReversalB.rawValue:
            cell.textLabel?.text = "Reverse String A"
        case QuestionType.stringReversalWithWordOrderingPerserved.rawValue:
            cell.textLabel?.text = "Reverse String but keep word ordering"
        case QuestionType.sortByAlpabeticalOrder.rawValue:
            cell.textLabel?.text = "Sorts words by alphabetical ordering"
        case QuestionType.convertDecimalToBinary.rawValue:
            cell.textLabel?.text = "convert decimal to binary"
        case QuestionType.palindrome.rawValue:
            cell.textLabel?.text = "Palindrome"
        case QuestionType.findGCD.rawValue:
            cell.textLabel?.text = "Finc GCD (Greatest Common Denominator)"
        case QuestionType.determineIfPrime.rawValue:
            cell.textLabel?.text = "Determine if value is Prime"
        case QuestionType.generatePrimes.rawValue:
            cell.textLabel?.text = "Generate a list of primes"
        case QuestionType.powerOf2.rawValue:
            cell.textLabel?.text = "Power of 2"
        case QuestionType.commonCharacters.rawValue:
            cell.textLabel?.text = "Common characters"
        case QuestionType.buzzFizz.rawValue:
            cell.textLabel?.text = "Buzz Fizz"
        default:
            break
        }
        
        
        
        return cell
    }
}
