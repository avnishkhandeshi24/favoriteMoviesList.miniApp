//
//  ViewController.swift
//  favoriteMoviesList.miniApp
//
//  Created by Avnish Khandeshi on 11/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addMovieTextFieldOutlet: UITextField!
    
    

    @IBOutlet weak var movieTableOutlet: UITableView!
    
    var rowClicked : String = "";
    
    var movies = ["Avengers: Endgame", "Thor: Ragnarok", "The Godfather", "Black Panther", "The Dark Knight", "The Lord of the Rings: The Return of the King", "Jurassic World", "Star Wars: A New Hope", "Star Wars: The Return of the Jedi", "Ratatouille", "The Love Bug", "The Gods Must be Crazy"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableOutlet.dataSource = self
        movieTableOutlet.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowClicked = (movieTableOutlet.cellForRow(at: indexPath)?.textLabel?.text)!
        performSegue(withIdentifier: "getInfoViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableOutlet.dequeueReusableCell(withIdentifier: "movieCell")!
        cell.textLabel?.text = movies[indexPath.row]
        cell.detailTextLabel?.text = ">"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! InfoViewController
        switch rowClicked {
        case "Avengers: Endgame":
            nvc.info = "Avengers Endgame is an action-packed movie about the avengers. If you've never heard of the avengers, then we have a problem."
        case "Thor: Ragnarok":
            nvc.info = "Thor Ragnarok is a very funny yet thrilling movie about Thor. Thor is an avenger. If you've never heard of the avengers, then we have a problem."
        case "The Godfather":
            nvc.info = "The Godfather is an interesting and tense movie about the transfer of power from father to son. It is a long movie, yet widely recognized as one of the best movies of all time."
        case "Black Panther":
            nvc.info = "Black Panther is a thrilling movie about an avenger called the Black Panther. He is the king of Wakanda, an advanced nation unknown to the rest of mankind. If you've never heard of the avengers, then we have a problem."
        case "The Dark Knight":
            nvc.info = "The Dark Knight is a movie filled with twists and turns about Batman vs. Joker."
        case "The Lord of the Rings: The Return of the Ring":
            nvc.info = "The Lord of the Rings is an exciting movie about a group of people who are trying to stop Sauron from conquering the world."
        case "Jurassic World":
            nvc.info = "Jurassic World is a fun movie about dinosaurs and humans."
        case "Star Wars: A New Hope":
            nvc.info = "Star Wars: A New Hope is about a small group of people who are fighting against the empire, a powerful government that is keeping \"order\" within the galaxy."
        case "Star Wars: The Return of the Jedi":
            nvc.info = "Star Wars: The Return of the Jedi is an exciting movie about the Jedi (the rebellion) fighting to finally bring an end to the empire."
        case "Ratatouille":
            nvc.info = "Ratatouille is a funny movie about a mouse who learns how to cook and teaches a janitor how to cook and brings fame back to a restaurant."
        case "The Love Bug":
            nvc.info = "The Love Bug is about a sentient vehicle that likes a character in the film called Jim, and eventually wins him a race."
        case "The Gods Must be Crazy":
            nvc.info = "A comedic film about a tribe that receives a coca-cola bottle from the sky (acutally an airplane) that they think is a gift from God. It causes a lot of conflict between the tribes there...watch the movie to find out what happens!"
        default:
            nvc.info="[This is a custom movie. There are no details about this movie.]"
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if let addedMovie = addMovieTextFieldOutlet.text {
            movies.append(addedMovie)
            addMovieTextFieldOutlet.text = ""
            addMovieTextFieldOutlet.placeholder = ""
            movieTableOutlet.reloadData()
        }
        else {
            addMovieTextFieldOutlet.placeholder = "Please enter a movie."
        }
    }
    
    @IBAction func removeItem(_ sender: UIBarButtonItem) {
        if let removedMovie = addMovieTextFieldOutlet.text {
            if let removedIndex : Int = Int(addMovieTextFieldOutlet.text!) {
                movies.remove(at: removedIndex - 1)
                addMovieTextFieldOutlet.text = ""
                movieTableOutlet.reloadData()
            }
            else {
                addMovieTextFieldOutlet.text = ""
            }
        }
        else {
            addMovieTextFieldOutlet.text = ""
        }
    }
    
    
    


}

