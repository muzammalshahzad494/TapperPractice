//
//  MasteringIOSViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 05/09/2022.
//

import UIKit
    
enum DownloadStatus {
    case downloading
    case finished
    case failed
    case cancelled
}
    
enum Cloud {
    case cirrus
    case cumulus
    case altocumulus
    case stratus
    case cumulonimbus
}
 
enum WeatherCondition {
    case sunny(temperature: Float)
    case rainy(inchesPerHour: Float)
    case cloudy(cloudType: Cloud, windSpeed: Float)
}


class MasteringIOSViewController: UIViewController {

    var currentStatus = DownloadStatus.downloading
    let currentWeather = WeatherCondition.cloudy(cloudType: .cirrus, windSpeed: 4.2)
    let currentWeathers = WeatherCondition.sunny(temperature: 12)
    let rainyWeather = WeatherCondition.rainy(inchesPerHour: 12)
    let cloudyWeather = WeatherCondition.cloudy(cloudType: .cirrus, windSpeed: 4.2)
    let height = 200
    let widht = 200
    var myLable : UILabel = {
        let mylable = UILabel()
        mylable.text = "Hello, Demo"
        mylable.textColor = .white
        return mylable
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Hello World"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let demoView = randomView(frame: CGRect(x: Int(UIScreen.main.bounds.width)/2  - widht/2, y: Int(UIScreen.main.bounds.height)/2  - height/2 , width: widht, height: height))
        let demoView1 = randomView(frame: CGRect(x: Int(UIScreen.main.bounds.width)/2  , y: Int(UIScreen.main.bounds.height)/2  - height/2 , width: widht, height: height))
        demoView1.backgroundColor = .link
        
        let demoView2 = randomView(frame: CGRect(x:0 , y: Int(UIScreen.main.bounds.height)/2  - height/2 , width: widht, height: height))
        demoView2.backgroundColor = .green
        
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        lable.text = "Hello, Buddy"
        lable.textColor = .white
        
        demoView.addSubview(lable)
        demoView2.addSubview(myLable)
        view.addSubview(demoView2)
        view.addSubview(demoView)
        view.addSubview(demoView1)
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: label.topAnchor),
            view.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: label.trailingAnchor)
        ])
        
    }
    
    private func printEnum(){
        switch currentStatus {
        case .downloading:
            break
        case .finished:
            break
        case .failed:
            break
        case .cancelled:
            break
        }
    }
    
    private func printWeatherConditions(){
        switch currentWeather {
        case .sunny(let temperature):
            print("\(temperature)")
        case .rainy(let inchesPerHour):
            print("\(inchesPerHour)")
        case .cloudy(let cloudType, let windSpeed):
            print("\(cloudType, windSpeed)")
        }
    }
}


class randomView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.backgroundColor = UIColor.red.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MyLabel: UILabel {
        
    required init(coder aDecode: NSCoder) {
        super.init(coder: aDecode)!
        initializeLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }

    func initializeLabel() {

        self.textAlignment = .left
        self.font = UIFont(name: "Halvetica", size: 17)
        self.textColor = UIColor.white
        text = "My title"

    }

}
