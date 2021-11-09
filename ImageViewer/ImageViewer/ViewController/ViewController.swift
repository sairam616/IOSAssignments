//
//  ViewController.swift
//  ImageViewer
//
//  Created by SaiRam Avala on 2021-11-08.
//

import UIKit

class ViewController: UIViewController,
                      UIPickerViewDelegate,
                      UIPickerViewDataSource,
                      AddingImageDelegateProtocol
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNames: UIPickerView!
    
    
    var manager: ImageManager = ImageManager()
    
    var rownum : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: "empty")
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as! ImageViewController
        aVC.delegate = self
    }
 
    
    func controllerDidFinishWithNewImage(i:imageList) {
        manager.addNewImage(ni: i)
        imageNames.reloadAllComponents()
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            Thread.sleep(forTimeInterval: 4)
            DispatchQueue.main.async
            { [self] in
                let data = try? Data(contentsOf: URL(string: manager.getAllImages()[rownum].url)! )
                self.imageView.image = UIImage ( data: data!)
            }
        }
        
    }
    
    func controllerDidCancel() {
        
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let data = try? Data(contentsOf: URL(string: self.manager.getAllImages()[row].url)! )
        self.imageView.image = UIImage ( data: data!)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "iOS"
        return manager.getAllImages()[row].name
    }
}
