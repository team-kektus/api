class AddGradingAspectsData < ActiveRecord::Migration[5.0]

  @@data = [
    {number: '1.1', name: 'Andmete salvestamine andmebaasi', max_points: 1, deadline: 4, is_multiple: false, url: 'https://courses.cs.ut.ee/2017/vl/spring/Main/Andmebaas'},
    {number: '1.2', name: 'Andmebaasi andmete esitamine', max_points: 1, deadline: 4, is_multiple: false, url: 'https://courses.cs.ut.ee/2017/vl/spring/Main/Andmebaas'},
    {number: '1.3', name: 'Agregeeritud andmete esitamine', max_points: 1, deadline: 4, is_multiple: false, url: 'https://courses.cs.ut.ee/2017/vl/spring/Main/Andmebaas'},
    {number: '1.4', name: 'Javascriptiga lehe muutmine', max_points: 1, deadline: 4, is_multiple: false},
    {number: '1.5', name: 'Leheosade hilisem laadimine', max_points: 1, deadline: 4, is_multiple: false, url: 'https://courses.cs.ut.ee/2017/vl/spring/Main/LeheosadeHilisemLaadimine'},
    {number: '1.6', name: 'Interaktiivne abiinfo', max_points: 1, deadline: 4, is_multiple: false},
    {number: '1.7', name: 'AJAX bookmarks', max_points: 1, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/AJAX'},
    {number: '1.8', name: 'Log-in järel näidatakse soovitud lehte', max_points: 1, deadline: 4, is_multiple: false},
    {number: '1.9', name: 'CDN & local', max_points: 1, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/CDN'},
    {number: '1.10', name: 'Koodirepositoorium', max_points: 1, deadline: 1, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Koodirepositoorium'},
    {number: '2.1', name: 'Data push', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/AndmeteSurumine'},
    {number: '2.2', name: 'Pangalink', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/PangalingiKasutamine'},
    {number: '2.3', name: 'Autentimine (Facebook/Google...)', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Autentimine'},
    {number: '2.4', name: 'AJAX', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/AJAX'},
    {number: '2.5', name: 'Veebilehel sisu esitamine kaardil', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/VeebilehelSisuEsitamineKaardil'},
    {number: '2.6', name: 'Võrguühenduseta kasutatav', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Offline'},
    {number: '2.7', name: 'XML-põhiste keelte kooskasutus', max_points: 3, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/XML'},
    {number: '2.8', name: 'Mitmekeelne kasutajaliides', max_points: 3, deadline: 4, is_multiple: false},
    {number: '2.9', name: 'Audentinutele sisu', max_points: 3, deadline: 4, is_multiple: false},
    {number: '2.10', name: 'Prototüüp', max_points: 3, deadline: 1, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Protot%C3%BC%C3%BCp'},
    {number: '3.1', name: 'Autentimine (ID-kaart)', max_points: 6, deadline: 4, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Autentimine'},
    {number: '3.2', name: 'Optimiseerimine', max_points: 6, deadline: 6, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Optimeerimine'},
    {number: '3.3', name: 'Automaattestid', max_points: 6, deadline: 6, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Testid'},
    {number: '3.4', name: 'Jõudlustestid', max_points: 6, deadline: 6, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Testid'},
    {number: '3.5', name: 'Testkeskkond', max_points: 6, deadline: 2, is_multiple: false, url: 'https://courses.cs.ut.ee/2017/vl/spring/Main/Testkeskkond'},
    {number: '3.6', name: 'Projektiplaan', max_points: 6, deadline: 1, is_multiple: false, url:'https://courses.cs.ut.ee/2017/vl/spring/Main/Projektiplaan'},
    {number: nil, name: 'HTML Kehtivus', max_points: 2, deadline: nil, is_multiple: true},
    {number: nil, name: 'CSS Kehtivus', max_points: 2, deadline: nil, is_multiple: true},
    {number: nil, name: 'Eraldatus', max_points: 2, deadline: nil, is_multiple: true},
    {number: nil, name: 'WCAG', max_points: 2, deadline: nil, is_multiple: true},
    {number: nil, name: 'Veebilehitsejate tugi', max_points: 1, deadline: nil, is_multiple: true},
    {number: nil, name: 'Aknasuuruste tugi', max_points: 1, deadline: nil, is_multiple: true},
    {number: nil, name: 'Heade praktikate järgimine', max_points: 3, deadline: nil, is_multiple: true}
]

  class GradingAspect < ActiveRecord::Base
  end

  def up
    @@data.each do |aspect|
      GradingAspect.create!(aspect)
    end
  end

  def down
    @@data.each do |aspect|
      if aspect[:number].present?
        obj = GradingAspect.find_by(number: aspect[:number])
        obj.destroy if obj.present?
      else
        obj = GradingAspect.find_by(name: aspect[:name])
        obj.destroy if obj.present?
      end
    end
  end
end
