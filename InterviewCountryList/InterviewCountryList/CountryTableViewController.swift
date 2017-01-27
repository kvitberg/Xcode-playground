//
//  CountryTableViewController.swift
//  InterviewCountryList
//
//  Created by Scott Kvitberg on 25/01/2017.
//  Copyright © 2017 Scott Kvitberg. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    // URL: https://restcountries.eu/rest/v1/all
        // "name" 
        // "capital"
    // Get data into list
    // Populate table with title = "name" and description = "capital"
    
    var countries = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }
    
    func fetchJSON() {
        print("Fetching JSON")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://restcountries.eu/rest/v1/all")
        let task = session.dataTask(with: url!){ (data, response, error) in
            
            if error != nil {
                
                print("something went wrong..")
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                        
                        if let responseString = try! JSONSerialization.jsonObject(with: urlContent, options: .allowFragments) as? [Any]{
                            
                        //Denne fungerer ikke: 
                            
//                      if let responseString = try! JSONSerialization.jsonObject(with: urlContent,                                           options: .allowFragments) as? [String: Any]{
                            
                        // Prøver jeg å gjøre noe slik, så fungerer det heller ikke:
//                         if let name = responseString["name"] as? String{ print(name)}
                            print(responseString)
                        }

                    } catch {
                        
                        print("JSON Processing Failed")
                    }
             
                }
            }
        
        }
        task.resume()
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "Country name goes here"
        cell.detailTextLabel?.text = "Capital name goes here"
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
