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
    
    
    var datePicker = UIDatePicker()
    var coreDataManager : CoreDataManager!
    var localNotificationManager : LocalNotificationManager!
    var receiveData : selectedObjectDelegate?
    var selectedData : TodoTasks!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        coreDataManager = CoreDataManager()
        localNotificationManager = LocalNotificationManager()
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
               print( localNotificationManager.notifications)
                let notifTime: Date = datePicker.date
                let dateComponent = Calendar.current.dateComponents([.year,.month,.day, .hour, .minute], from: notifTime)
                print(dateComponent)
                localNotificationManager.notifications.removeAll()
                localNotificationManager.notifications.append(Notification(id: "\(title)", title: title, date: dateComponent))
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
            //            TODO GUNCELLENEN VERININ CREATE TARIHI DEGISELIM MI ?
            let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            mainVC.data = coreDataManager.fetchData()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    
    func createDatePicker(){
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(buttonTapped))
            toolbar.setItems([spaceButton,doneButton], animated: true)
            dateTextField.inputAccessoryView = toolbar
            datePicker.preferredDatePickerStyle = .inline
            dateTextField.inputView = datePicker
        }

        @objc func buttonTapped() {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm"
            let date =  formatter.string(from: datePicker.date)
            dateTextField.text = date
            self.view.endEditing(true)
        }
}
