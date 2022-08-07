//
//  ViewController.swift
//  SongHelpApp
//
//  Created by Donizetti de Souza on 8/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var songList: [Song] = []  //Lista com arquivos para serem exibidos na tabela
    var cellId: String = "cellBandId" //Variavel que refere-se ao ID da categoria de itens a ser mostrado. Nome aleatorio
     
    @IBOutlet weak var tableView: UITableView! //Tabela exibida na tela main
    
    override func viewDidLoad() { //Funcao de exibicao da viewcontroles
        super.viewDidLoad() //Funcao de exibicao
        configureSongList() //Funcao com arquivos a serem exibidos
        configureTableview() // Funcao de criar a lista
        title = "Lista de músicas" //Titulo da viewcontroler
    }
    
    func configureTableview(){ // Funcao de criar a lista
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil),  forCellReuseIdentifier: cellId) // Carregando configuracoes da table view. necessario registrado,
        tableView.dataSource = self // Carregando configuracoes da lista, quem esta informando a fonte. Nesse caso a tableview automaticamente informa os dados
        tableView.delegate = self
    }
    
    func configureSongList() { //Funcao com arquivos a serem exibidos
        let sutilmente = Song(name: "Sutilmente", image: #imageLiteral(resourceName: "sutilmente"), band: "Skank", link: "https://www.skank.com.br" ) //#imageLiteral(
        songList.append(sutilmente) //adiciona elemento na lista
        let wonderwall = Song(name: "Wonderwall", image: #imageLiteral(resourceName: "wonderwall"), band: "Oasis", link: "https://www.oasisnet.com")
        songList.append(wonderwall)
        let yellowSubmarine = Song(name: "Yellow Submarine", image: #imageLiteral(resourceName: "yellowsubmarine"), band: "Beatles", link: "https://www.thebeatles.com" )
        songList.append(yellowSubmarine)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count // Configuracoes da lista
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // Configuracoes da lista
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! SongTableViewCell //carregando a celula a ser exibida
        let row = indexPath.row // carrega o numero da linha clicada
        let song = songList[row] // carrega a lista referente ao numero
        cell.songNameLabel.text = song.songName // plota nome da linha
        cell.bandImageView.image = song.bandImage // plota imagem da linha
        cell.selectionStyle = .none //nao mostra na tabela o item selecionado
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let song = songList[row]
        let songDetailVC = SongDetailViewController(selectedSong: song)
        navigationController?.pushViewController(songDetailVC, animated: true)
        
    }
}

