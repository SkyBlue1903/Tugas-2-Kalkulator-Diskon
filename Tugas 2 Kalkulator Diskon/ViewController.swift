//
//  ViewController.swift
//  Tugas 2 Kalkulator Diskon
//
//  Created by Erlangga Anugrah Arifin on 11/10/22.
//

import UIKit
import Toast

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var originalTextField: UITextField!
    @IBOutlet weak var percentageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.isHidden = true
        resultLabel.isHidden = true
        resetButton.isHidden = true
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if sender.tag == 1 {
            if originalTextField.text!.isEmpty || percentageTextField.text!.isEmpty {
                toastError.show()
            } else {
                let hargaAsli = Int(originalTextField.text!) ?? 0
                let persentase = Int(percentageTextField.text!) ?? 0
                resultLabel.text = "Harga setelah diskon: Rp \(hargaAsli - (hargaAsli * persentase / 100))\nAnda menghemat: Rp \(hargaAsli * persentase / 100)"
                resultView.isHidden = false
                resultLabel.isHidden = false
                resetButton.isHidden = false
            }
        } else if sender.tag == 2 { // reset button
            originalTextField.text = ""
            percentageTextField.text = ""
            resultView.isHidden = true
            resultLabel.isHidden = true
            resetButton.isHidden = true
        }
    }
    

    let toastError = Toast.default(
        image: UIImage(systemName: "exclamationmark.triangle")!,
        title: "Gagal",
        subtitle: "Lengkapi semua bidang dulu"
    )

}

