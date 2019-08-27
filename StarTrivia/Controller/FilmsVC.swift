//
//  FilmsVC.swift
//  
//
//  Created by Ravi on 22/08/19.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var crawlLbl: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    var person: Person!
    
    let api = FilmApi()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        prevBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
    }
    
    func getFilm(url: String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setupUI(film: film)
            }
        }
    }
    
    func setupUI(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let replaceCrawl = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLbl.text = replaceCrawl.replacingOccurrences(of: "\r", with: "")
    }
    
    @IBAction func prevClick(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        prevBtn.isEnabled = currentFilm == 0 ? false : true
        getFilm(url: films[currentFilm])
    }

}
