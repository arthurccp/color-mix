//
//  SecondViewController.swift
//  color-mix
//
//  Created by Arthur on 29/02/2024.
//  Copyright © 2024 Arthur. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    // Propriedade para armazenar a cor recebida da ViewController
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Verificar se há uma cor recebida
        if let color = backgroundColor {
            // Configurar a cor de fundo da view com a cor recebida
            colorView.backgroundColor = color
        }
    }
}

