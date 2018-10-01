//
//  ViewController.swift
//  SampleCamera
//
//  Created by 渡邊丈洋 on 2018/09/26.
//  Copyright © 2018年 takehiro. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var myImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func selectedCamera() {
        // カメラが使用できるかチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let picker = UIImagePickerController()
            // カメラを起動する
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func selectedLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }

    @IBAction func onCameraButtonTapped(_ sender: UIBarButtonItem) {
        let controller = UIAlertController(title: "", message: "どの方法で写真を読み込みますか？", preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "写真を撮影する", style: .default) { (action) in
             self.selectedCamera()
        })
        controller.addAction(UIAlertAction(title: "カメラロールから読み込む", style: .default) { (action) in
             self.selectedLibrary()
        })
        controller.addAction(UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
        })
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func onSaveButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func onEditButtonTapped(_ sender: UIBarButtonItem) {
    }
    
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageView.image = editedImage
            self.myImage = editedImage
        }
        if myImageView.image != nil {
            myLabel.isHidden = true
        }
        // UIImagePickerControllerを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
}
