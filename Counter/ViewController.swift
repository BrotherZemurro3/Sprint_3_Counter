//
//  ViewController.swift
//  Counter
//
//  Created by Дионисий Коневиченко on 15.10.2024.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    private var counter: Int = 0
    
    @IBOutlet weak var showCount: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var textFromConsole: UITextView!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "[dd-MM-yyyy HH:mm]"
        return formatter
    }()
    
    private func formattedDate() -> String {
        return dateFormatter.string(from: Date())
    }
    
    
    @IBAction func buttonIncrease(_ sender: Any) {
    counter+=1
        showCount.text = ("Значение счетчика: \(counter)")
        textFromConsole.text += "\(formattedDate()): Увеличение значения на + 1\n"
        let range = NSMakeRange(textFromConsole.text.count - 1, 0)
        textFromConsole.scrollRangeToVisible(range)
        
    }
    @IBAction private func buttonDecrease(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            showCount.text = "Значение счетчика: \(counter)"
            textFromConsole.text += "\(formattedDate()): Уменьшение значения на - 1\n"
            let range = NSMakeRange(textFromConsole.text.count - 1, 0)
            textFromConsole.scrollRangeToVisible(range)
        } else {
            textFromConsole.text += "\(formattedDate()): Попытка достигнуть отрицательного числа\n"
            let range = NSMakeRange(textFromConsole.text.count - 1, 0)
            textFromConsole.scrollRangeToVisible(range)
        }
    }
    
    @IBAction private func buttonResetToZero(_ sender: Any) {
        counter = 0
        showCount.text = ("Значение счетчика: \(counter)")
        textFromConsole.text += "\(formattedDate()): Сброс значения\n"
        let range = NSMakeRange(textFromConsole.text.count - 1, 0)
        textFromConsole.scrollRangeToVisible(range)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPlus.tintColor = .yellow
        buttonPlus.backgroundColor = .blue
        buttonMinus.tintColor = .yellow
        buttonMinus.backgroundColor = .red
        buttonReset.tintColor = .yellow
        buttonReset.backgroundColor = .green
        showCount.text = "Значение счетчика: \(counter)"
        textFromConsole.text = "\(formattedDate()): История изменения счетчика\n"
        textFromConsole.isEditable = false
        textFromConsole.scrollsToTop = true
        
        
        
        
        
        // Do any additional tsetup after loading the view.
    }
    
    
}
