//
//  TaskDetailTableViewController.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import UIKit

class TaskDetailTableViewController: UITableViewController,TaskDetailTableViewModelDelegate {
    
    
    
    @IBOutlet weak var addTaskTappedButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var deadLineDateLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // TODO: For Texting

    
    var viewModel : TaskDetailViewModelProtocol!{
        didSet{
            viewModel.delegate = self
        }
    }
    
    var screenType: builderChoice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad()
        self.setupHideKeyboardWhenTapOutside()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func handleOutput(_ output: ViewModelOutput) {
        switch output {
        case .showToDoDetail(let taskDetailPresentation):
            addTaskTappedButton.setTitle(TaskDetailViewController.addTaskButtonText.rawValue, for: .normal)
            titleTextField.text = taskDetailPresentation.title
            detailTextView.text = taskDetailPresentation.detail
            reminderSwitch.isOn = deadLineDateLabel.text != ""
            
            if let endDate = taskDetailPresentation.endDate{
                deadLineDateLabel.text = convertToString(date: endDate)
            } else {
                deadLineDateLabel.text = ""
                
            }
            
        case .showToDoAdd:
            //TODO: buraya bakılıcak
            reminderSwitch.isOn = deadLineDateLabel.text != ""
        case.showAlert:
            setAlert(messeges: "Hedef Başlığı Boş Olamaz")
        }
    }
    
    
    func navigate(to route: DetailViewRouter) {
        switch route {
        case .goBack:
            self.navigationController?.popToRootViewController(animated: true)
        case .saveAndBack:
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text,
              let detail = detailTextView.text else {
                  print(" Veriler Artık Options Değil ");return }
        if(reminderSwitch.isOn && deadLineDateLabel.text == ""){
            setAlert(messeges: "Lüften Tarih seciniz")
        }
        else {
            let task = TaskDetailPresentation(title: title, detail: detail, endDate: reminderSwitch.isOn ? datePicker.date : nil)
            viewModel.addTodo(task: task)
            
        }
    }
    func setAlert(messeges: String){
        
        let alert = UIAlertController(title: "Uyarı", message: messeges, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in switch action.style{
        case .default:
            print("default")
        case .cancel:
            print("Cancel")
        case.destructive:
            print("destructive")
        default:
            break
        }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        deadLineDateLabel.text = convertToString(date: sender.date)
    }
    
    @IBAction func reminderSwitchChanged(_ sender: UISwitch) {
        deadLineDateLabel.textColor = (reminderSwitch.isOn ? .black : .lightGray )
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
// MARK: - Table view data source
extension TaskDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case IndexPath(row: 1 , section: 2 ):
            return reminderSwitch.isOn ? 150 : 0
        case IndexPath(row: 0 , section: 1 ):
            return 107
        default:
            return 44
        }
    }
    
}
extension TaskDetailTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
