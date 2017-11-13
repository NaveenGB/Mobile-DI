//
//  ListViewController.swift
//  MobileDi
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftLoader
import Toast_Swift
import SDWebImage

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var menuBtn: UIButton!
    @IBOutlet var listTV: UITableView!
    var tableDic : NSDictionary = NSDictionary()
    var resultArr : NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if ReachabilityUrl.isConnectedToNetwork() == true{
            call()
        }
        else{
            self.view.makeToast("No Internet Connection")
        }
        
        
        // Register Nib
        listTV.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        //Status bar color
        SettingsiPhone.statusBarColor(col: SettingsiPhone.statusBackgroundColor)
    }
    override func viewWillLayoutSubviews() {
        switch UIDevices().screenType {
        //Screen Variation
        case .iPhone4:
            // Code for iPhone 4 & iPhone 4s
            break
        case .iPhone5:
            // Code for iPhone 5, 5s & iPhone se
            listTV.rowHeight = 140
            break
        case .iPhone6:
            // Code for iPhone 6, 6s & iPhone 7
            listTV.rowHeight = 140
            break
        case .iPhone6Plus:
            // Code for iPhone 6 Plus, 6s Plus & iPhone 7 Plus
            listTV.rowHeight = 145
            break
        case .iPhoneX:
            // Code for iPhoneX
            listTV.rowHeight = 140
            break
        case .iPad2:
            // Code for iPad2
            listTV.rowHeight = 205
            break
        case .iPadPro:
            // Code for iPad Air, iPad Air2, iPad Retina & iPad pro 9.7
            listTV.rowHeight = 205
            break
        case .iPadPro12:
            // Code for iPad pro 12.9
            break
        default:
            break
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuBtnClicked(_ sender: UIButton) {
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return listTV.rowHeight
    }
    func tableView(_ tableView: UITableView, willDisplay cell:
        UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -cell.frame.width, 1, 1)
        
        UIView.animate(withDuration: 0.33) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DataTableViewCell
        tableDic = self.resultArr[indexPath.row] as! NSDictionary
        
        print(self.tableDic)
        
        cell.nameLbl.text = tableDic["title"] as? String
        
        //Profile Img
        cell.img.sd_setImage(with: URL(string: (self.tableDic["thumbnailUrl"] as? String)!), placeholderImage: UIImage(named: " "));
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tableDic1 = self.resultArr[indexPath.row] as! NSDictionary
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.nameStr = tableDic1["title"] as! String
        vc.imgStr = tableDic1["thumbnailUrl"] as! String
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- callWebService
    func call(){
        SwiftLoader.show(animated: true)
        print("request Called")
        Alamofire.request(ReachabilityUrl.url, method: .get,parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            debugPrint(response)
            switch response.result {
            case .success:
                self.resultArr = []
                if let JSON:NSArray = response.result.value  as! NSArray? {
                    self.resultArr = JSON
                    self.resultArr.adding(JSON)
                    print(self.resultArr.count)
                    print("JSON: \(JSON)")
                    self.listTV.reloadData()
                    SwiftLoader.hide()
                }
            case .failure(let error):
                print("Error: \(error)")
                if (error._code == -1005){
                    self.call()
                }else{
                    SwiftLoader.hide()
                    self.view.makeToast("Please try after sometime.")
                }
            }
        }
    }
}


