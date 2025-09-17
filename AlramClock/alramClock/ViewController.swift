//
//  ViewController.swift
//  alramClock
//
//  Created by 559 on 9/17/25.
//

import UIKit

var alarmTime: String = ""
class ViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        Timer.scheduledTimer(timeInterval: interval,
                             target: self,
                             selector: timeSelector,
                             userInfo: nil,
                             repeats: true)


        datePicker.addTarget(self,
                             action: #selector(changeDatePicker(_:)),
                             for: .valueChanged)
    }


    @objc func changeDatePicker(_ sender: UIDatePicker) {
        let fullFormatter = DateFormatter()
        fullFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택시간 " + fullFormatter.string(from: sender.date)

        let shortFormatter = DateFormatter()
        shortFormatter.dateFormat = "HH:mm"
        alarmTime = shortFormatter.string(from: sender.date)
    }

    @objc func updateTime() {
        let now = NSDate()

        let fullFormatter = DateFormatter()
        fullFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 " + fullFormatter.string(from: now as Date)

        let shortFormatter = DateFormatter()
        shortFormatter.dateFormat = "HH:mm"
        let currentTime = shortFormatter.string(from: now as Date)


        if currentTime == alarmTime {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }


}

