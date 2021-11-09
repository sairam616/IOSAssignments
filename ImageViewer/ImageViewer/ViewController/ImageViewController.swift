//
//  ImageViewController.swift
//  ImageViewer
//
//  Created by SaiRam Avala on 2021-11-08.
//

import UIKit

protocol AddingImageDelegateProtocol {
    func controllerDidFinishWithNewImage(i:imageList)// did , will ,
    func controllerDidCancel()
}


class ImageViewController: UIViewController {
    public var delegate: AddingImageDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBOutlet weak var imageURL: UITextField!
    @IBOutlet weak var imageTitle: UITextField!
    
    @IBAction func btnCancel(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAdd(_ sender: UIButton) {
        if let title = imageTitle.text {
            if let URL = imageURL.text {
                if !title.isEmpty && !URL.isEmpty{
                    let newImage = imageList(n: title, u: URL)
                    delegate?.controllerDidFinishWithNewImage(i:newImage)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}
