//
//  DetailViewController.swift
//  TodoAppExample
//
//  Created by Ali Kose on 8.10.2021.
//

import UIKit
class DetailViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var datePicker : UIDatePicker!
    
    var coreDataManager : CoreDataManager!
    var localNotificationManager : LocalNotificationManager!
    var selectedData : TodoTasks! // Bunu da builder ile ekran olusturulurken alicam
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createDatePicker()
        coreDataManager = CoreDataManager() // Builder ile
        localNotificationManager = LocalNotificationManager() // Builder ile
        
        print("Bildirim Eklendi mi")
        localNotificationManager.listScheduledNotifications()
        
        saveButton.moveKeyboard()
        
        if selectedData == nil {
            print("Yeni item ekleniyor")
        }
        else {
            titleTextField.text = selectedData.title
            detailTextField.text = selectedData.detailTitle
            dateTextField.text = selectedData.date
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text,  let detail = detailTextField.text  , let date = dateTextField.text  else{return print("optional kurtamk icin yapildi bunu gorduysen kurtarilamamsitir.")}
        
        guard title != "" , detail != "" , date  != ""  else{
            let alert = UIAlertController(title: "Bos Data Olamaz", message: "Hepsini doldurun", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return print("Bos Veri bar")}
        
        if selectedData == nil {
            
            coreDataManager.saveData(title: title , subtitle: detail, date: date) { complete in
                if complete {
                    self.navigationController?.popToRootViewController(animated: true)
                }
                //                TODO BURADA DATE DEN DATECOMPONENTS CEVIR.
                let notifTime: Date = datePicker.date
                let dateComponent = Calendar.current.dateComponents([.year,.month,.day, .hour, .minute], from: notifTime)
                print(dateComponent)
                localNotificationManager.notifications.removeAll()
                localNotificationManager.notifications.append(Notification(id: "\(title)", title: title, subTitle: detail,date: dateComponent))
                localNotificationManager.schedule()
                print( localNotificationManager.notifications)
                
                
            }
        }
        
        else {
            selectedData.title = titleTextField.text
            selectedData.detailTitle = detailTextField.text
            selectedData.date = dateTextField.text
            coreDataManager.updateData()
            print("Detail ekraninda veri guncellendi.")
            
            //     TODO GUNCELLENEN VERININ CREATE TARIHI OTOMATIK DEGISIYOR.
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    
    func createDatePicker(){
        datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .automatic
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: #selector(deleteButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTapped))
        toolbar.setItems([deleteButton,spaceButton,doneButton], animated: true)
        dateTextField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle = .inline
        dateTextField.inputView = datePicker
    }
    
    @objc func doneButtonTapped() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let date =  formatter.string(from: datePicker.date)
        dateTextField.text = date
        self.view.endEditing(true)
    }
    @objc func deleteButtonTapped() {
        dateTextField.text = ""
        self.view.endEditing(true)
    }
    
    
}
