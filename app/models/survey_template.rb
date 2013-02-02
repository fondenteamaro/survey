# encoding: utf-8
class SurveyTemplate < ActiveRecord::Base
  attr_accessible :nome, :attivo, :categoria, :descrizione
  has_many :survey_template_lines , :dependent => :destroy
  has_many :survey_responses
  attr_accessible :linee_guida
  has_attached_file :linee_guida

  def self.init_survey
    SurveyTemplate.destroy_all
    s=SurveyTemplate.create(:nome=>"Rapporto ANIASA 2013", :categoria=>"RAPPORTI ANIASA ANNUALI", :attivo=>true )
    s.save

    [
      ["10","Fatturato da contratti di noleggio per contenuto di servizi","","Fatturato da contratti di noleggio totale","€"],
      ["20","Fatturato da contratti di noleggio per contenuto di servizi",""," - di cui basic revenue","€"],
      ["30","Fatturato da contratti di noleggio per contenuto di servizi",""," - di cui ancillary revenue","€"],
      ["40","Fatturato da contratti di noleggio per contenuto di servizi",""," - di cui other revenue","€"],
      ["50","Fatturato da contratti di noleggio per tipologia operatore","DA001-FAT-TOT","Fatturato da contratti di noleggio totale","€"],
      ["60","Fatturato da contratti di noleggio per tipologia operatore","DA002-FAT-DIR","-di cui conseguito da corporate/agenti","€"],
      ["70","Fatturato da contratti di noleggio per tipologia operatore","DA003-FAT-IND","-di cui conseguito da licenziatari/franchisee","€"],
      ["80","Fatturato da contratti di noleggio per tipologia di location","DA001-FAT-TOT","Fatturato da contratti di noleggio totale","€"],
      ["90","Fatturato da contratti di noleggio per tipologia di location","DA004-FAT-APT","-di cui realizzato presso aeroporti","€"],
      ["100","Fatturato da contratti di noleggio per tipologia di location","DA005-FAT-DOW","-di cui realizzato su location downtown","€"],
      ["110","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DA001-FAT-TOT","Fatturato da contratti di noleggio totale","€"],
      ["120","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DA006-FAT-LEI","-di cui conseguito sul segmento leisure","€"],
      ["130","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DA007-FAT-BUS","-di cui conseguito sul segmento business","€"],
      ["140","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DA008-FAT-REP","-di cui realizzato sul segmento replacement","€"],
      ["150","Fatturato da contratti di noleggio per tipologia veicolo","DA001-FAT-TOT","Fatturato da contratti di noleggio totale","€"],
      ["160","Fatturato da contratti di noleggio per tipologia veicolo","DA009-FAT-VET","-di cui realizzato su vetture","€"],
      ["170","Fatturato da contratti di noleggio per tipologia veicolo","DA010-FAT-FUR","-di cui realizzato su furgoni","€"],
      ["180","Giorni di noleggio per tipologia veicolo e operatore","DA011-GIO-TOT","Giorni di noleggio totali","n°"],
      ["190","Giorni di noleggio per tipologia veicolo e operatore","DA012-GIO-VED","-di cui vetture di corporate/agenti","n°"],
      ["200","Giorni di noleggio per tipologia veicolo e operatore","DA013-GIO-VEI","-di cui vetture di licenziatari/franchisee","n°"],
      ["210","Giorni di noleggio per tipologia veicolo e operatore","DA014-GIO-FUD","-di cui furgoni di corporate/agenti","n°"],
      ["220","Giorni di noleggio per tipologia veicolo e operatore","DA015-GIO-FUI","-di cui furgoni di licenziatari/franchisee","n°"],
      ["230","Giorni di noleggio per tipologia location","DA011-GIO-TOT","Giorni di noleggio totali","n°"],
      ["240","Giorni di noleggio per tipologia location","DA016-GIO-APT","-di cui realizzato presso aeroporti","n°"],
      ["250","Giorni di noleggio per tipologia location","DA017-GIO-DOW","-di cui realizzato su location downtown","n°"],
      ["260","Numero di noleggi per tipologia veicolo e operatore","DA018-NOL-TOT","N° di noleggi totali","n°"],
      ["270","Numero di noleggi per tipologia veicolo e operatore","DA019-NOL-VED","-di cui vetture di corporate/agenti","n°"],
      ["280","Numero di noleggi per tipologia veicolo e operatore","DA020-NOL-VEI","-di cui vetture di licenziatari/franchisee","n°"],
      ["290","Numero di noleggi per tipologia veicolo e operatore","DA021-NOL-FUD","-di cui furgoni di corporate/agenti","n°"],
      ["300","Numero di noleggi per tipologia veicolo e operatore","DA022-NOL-FUI","-di cui furgoni di licenziatari/franchisee","n°"],
      ["310","N° di noleggi per tipologia location","DA018-NOL-TOT","Numeri di noleggi totali","n°"],
      ["320","N° di noleggi per tipologia location","DA023-NOL-APT","-di cui presso aeroporti","n°"],
      ["330","N° di noleggi per tipologia location","DA024-NOL-DOW","-di cui su location downtown","n°"],
      ["340","Distribuzione dei noleggi per genere della clientela ","DA025-NOL-MAS","% di noleggi a maschi","%"],
      ["350","Distribuzione dei noleggi per genere della clientela ","DA026-NOL-FEM","% di noleggi a femmine","%"],
      ["360","Distribuzione dei noleggi per età della clientela ","DA027-NOL-D18","% di noleggi a clienti da 18 a 34 anni","%"],
      ["370","Distribuzione dei noleggi per età della clientela ","DA028-NOL-D35","% di noleggi a clienti da 35 a 54 anni","%"],
      ["380","Distribuzione dei noleggi per età della clientela ","DA029-NOL-D55","% di noleggi a clienti oltre 55 anni","%"],
      ["390","Distribuzione dei noleggi per nazionalità della clientela ","DA030-NOL-ITA","% di noleggi a clienti italiani","%"],
      ["400","Distribuzione dei noleggi per nazionalità della clientela ","DA031-NOL-UER","% di noleggi a clienti della Unione Europea","%"],
      ["410","Distribuzione dei noleggi per nazionalità della clientela ","DA032-NOL-USA","% di noleggi a clienti degli Stati Uniti","%"],
      ["420","Distribuzione dei noleggi per nazionalità della clientela ","DA033-NOL-ALT","% di noleggi a clienti di altra nazionalità","%"],
      ["430","Distribuzione dei noleggi per motivi di utilizzo","DA034-NOL-LEI","% di noleggi per leisure","%"],
      ["440","Distribuzione dei noleggi per motivi di utilizzo","DA035-NOL-BUS","% di noleggi per business","%"],
      ["450","Distribuzione dei noleggi per motivi di utilizzo","DA036-NOL-REP","% di noleggi per replacement","%"],
      ["460","Durata media per tipologia veicolo e operatore","DA037-DUR-TOT","Durata media totale","giorni"],
      ["470","Durata media per tipologia veicolo e operatore","DA038-DUR-VED","-di cui vetture di corporate/agenti","giorni"],
      ["480","Durata media per tipologia veicolo e operatore","DA039-DUR-VEI","-di cui vetture di licenziatari/franchisee","giorni"],
      ["490","Durata media per tipologia veicolo e operatore","DA040-DUR-FUD","-di cui furgoni di corporate/agenti","giorni"],
      ["500","Durata media per tipologia veicolo e operatore","DA041-DUR-FUI","-di cui furgoni di licenziatari/franchisee","giorni"],
      ["510","Flotta media per tipologia veicolo e operatore","DA042-FLM-TOT","Flotta media totale","n°"],
      ["520","Flotta media per tipologia veicolo e operatore","DA043-FLM-VED","-di cui vetture di corporate/agenti","n°"],
      ["530","Flotta media per tipologia veicolo e operatore","DA044-FLM-VEI","-di cui vetture di licenziatari/franchisee","n°"],
      ["540","Flotta media per tipologia veicolo e operatore","DA045-FLM-FUD","-di cui furgoni di corporate/agenti","n°"],
      ["550","Flotta media per tipologia veicolo e operatore","DA046-FLM-FUI","-di cui furgoni di licenziatari/franchisee","n°"],
      ["560","Distribuzione della flotta media vetture per segmento di auto ","DA042-FLM-VET","Flotta media vetture ","n°"],
      ["570","Distribuzione della flotta media vetture per segmento di auto ","DA047-FLM-VEA","N° delle auto del segmento A – piccole","n°"],
      ["580","Distribuzione della flotta media vetture per segmento di auto ","DA048-FLM-VEB","N° delle auto del segmento B – utilitarie","n°"],
      ["590","Distribuzione della flotta media vetture per segmento di auto ","DA049-FLM-VEC","N° delle auto del segmento C – medie","n°"],
      ["600","Distribuzione della flotta media vetture per segmento di auto ","DA050-FLM-VED","N° delle auto del segmento D - medie superiori","n°"],
      ["610","Distribuzione della flotta media vetture per segmento di auto ","DA051-FLM-VEE","N° delle auto del segmento E – superiori","n°"],
      ["620","Distribuzione della flotta media vetture per segmento di auto ","DA052-FLM-VEF","N° delle auto del segmento F - alto di gamma ","n°"],
      ["630","Flotta puntuale al 30 agosto per tipologia veicolo e operatore","DA053-FLX-TOT","Flotta puntuale al 30 agosto 2010","n°"],
      ["640","Flotta puntuale al 30 agosto per tipologia veicolo e operatore","DA054-FLX-VED","-di cui vetture di corporate/agenti","n°"],
      ["650","Flotta puntuale al 30 agosto per tipologia veicolo e operatore","DA055-FLX-VEI","-di cui vetture di licenziatari/franchisee","n°"],
      ["660","Flotta puntuale al 30 agosto per tipologia veicolo e operatore","DA056-FLX-FUD","-di cui furgoni di corporate/agenti","n°"],
      ["670","Flotta puntuale al 30 agosto per tipologia veicolo e operatore","DA057-FLX-FUI","-di cui furgoni di licenziatari/franchisee","n°"],
      ["680","N° immatricolazioni per tipologia veicolo","DA058-IMM-TOT","Immatricolazioni totali","n°"],
      ["690","N° immatricolazioni per tipologia veicolo","DA059-IMM-VET","-di cui vetture","n°"],
      ["700","N° immatricolazioni per tipologia veicolo","DA060-IMM-FUR","-di cui furgoni","n°"],
      ["710","N° di auto acquisite in leasing e noleggio (non immatricolate)","DA061-ACQ-TOT","Acquisizioni totali ","n°"],
      ["720","N° di auto acquisite in leasing e noleggio (non immatricolate)","DA062-ACQ-VET","-di cui vetture","n°"],
      ["730","N° di auto acquisite in leasing e noleggio (non immatricolate)","DA063-ACQ-FUR","-di cui furgoni","n°"],
      ["740","Costo sostenuto per l’acquisto dei veicoli (solo immatricolazioni)","DA064-CIM-TOT","Costo immatricolazioni totali","€"],
      ["750","Costo sostenuto per l’acquisto dei veicoli (solo immatricolazioni)","DA065-CIM-VET","-di cui vetture","€"],
      ["760","Costo sostenuto per l’acquisto dei veicoli (solo immatricolazioni)","DA066-CIM-FUR","-di cui furgoni","€"],
      ["770","N° furti per tipologia veicolo","DA067-FUR-TOT","Numero di furti totali","n°"],
      ["780","N° furti per tipologia veicolo","DA068-FUR-VET","-di cui vetture","n°"],
      ["790","N° furti per tipologia veicolo","DA069-FUR-FUR","-di cui furgoni","n°"],
      ["800","N° veicoli recuperati da furti per tipologia veicolo","DA070-VRF-TOT","Numero di veicoli recuperati da furti totali","n°"],
      ["810","N° veicoli recuperati da furti per tipologia veicolo","DA071-VRF-VET","-di cui vetture","n°"],
      ["820","N° veicoli recuperati da furti per tipologia veicolo","DA072-VRF-FUR","-di cui furgoni","n°"],
      ["830","N° appropriazioni indebite","DA073-APP-TOT","Numero di appropriazioni indebite totali","n°"],
      ["840","N° appropriazioni indebite","DA074-APP-VET","-di cui vetture","n°"],
      ["850","N° appropriazioni indebite","DA075-APP-FUR","-di cui furgoni","n°"],
      ["860","N° veicoli recuperati da appropriazioni indebite per tipologia veicolo","DA076-VRA-TOT","Numero di veicoli recuperati da appropriazioni indebite totali","n°"],
      ["870","N° veicoli recuperati da appropriazioni indebite per tipologia veicolo","DA077-VRA-VET","-di cui vetture","n°"],
      ["880","N° veicoli recuperati da appropriazioni indebite per tipologia veicolo","DA078-VRA-FUR","-di cui furgoni","n°"],
      ["890","Danno derivanti da furti","DA079-DFU-TOT","Danno derivante da furti","€"],
      ["900","Permanenza veicoli in flotta","DA080-PER-VET","Permanenza vetture in flotta","mesi"],
      ["910","Permanenza veicoli in flotta","DA081-PER-FUR","Permanenza furgoni in flotta","mesi"],
      ["920","Occupati","DA082-DIP-TOT","Occupati totali","n°"],
      ["930","Occupati","DA083-DIP-DIR","-di cui di corporate/agenti","n°"],
      ["940","Occupati","DA084-DIP-IND","-di cui di licenziatari/franchisee","n°"],
      ["950","Punti vendita per tipologia operatore","DA085-PUN-TOT","Punti vendita totali","n°"],
      ["960","Punti vendita per tipologia operatore","DA086-PUN-DIR","-di cui di corporate/agenti","n°"],
      ["970","Punti vendita per tipologia operatore","DA087-PUN-IND","-di cui di licenziatari/franchisee","n°"],
      ["980","Punti vendita per tipologia location","DA085-PUN-TOT","Punti vendita totali","n°"],
      ["990","Punti vendita per tipologia location","DA088-PUN-APT","-di cui presso aeroporti","n°"],
      ["1000","Punti vendita per tipologia location","DA089-PUN-DOW","-di cui downtown","n°"],
      ["1010","Usato","DA090-USA-TOT","N° di veicoli usati venduti","n°"],
      ["1020","Usato","DA091-USA-MKT","-di cui di venduti sul mercato ","n°"],
      ["1030","Usato","DA092-USA-BUY","-di cui ceduti in buy back al fornitore","n°"]].each do |ff|
       l=s.survey_template_lines.build
       l.progressivo= ff.shift
       l.gruppo= ff.shift
       l.codice=ff.shift
       l.domanda=ff.shift
       l.um=ff.shift
       l.tipo_dato="numerico"
       l.save

    end

    s=SurveyTemplate.create(:nome=>"OSSERVATORIO ANIASA TRIM. 2013", :categoria=>"OSSERVATORIO ANIASA TRIMESTRALI", :attivo=>true )
    s.save

    [["10","Fatturato da contratti di noleggio per contenuto di servizi","","Fatturato da contratti di noleggio totale"],
        ["20","Fatturato da contratti di noleggio per contenuto di servizi",""," - di cui basic revenue"],
        ["30","Fatturato da contratti di noleggio per contenuto di servizi",""," - di cui ancillary revenue"],
        ["40","Fatturato da contratti di noleggio per contenuto di servizi",""," - di cui other revenue"],
        ["50","Fatturato da contratti di noleggio per tipologia di location","DS001-FAT-TOT","Fatturato da contratti di noleggio totale"],
        ["60","Fatturato da contratti di noleggio per tipologia di location","DS004-FAT-APT","- di cui realizzato presso aeroporti"],
        ["70","Fatturato da contratti di noleggio per tipologia di location","DS005-FAT-DOW","- di cui realizzato su location downtown"],
        ["80","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DS001-FAT-TOT","Fatturato da contratti di noleggio totale"],
        ["90","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DS006-FAT-LEI","- di cui conseguito sul segmento leisure"],
        ["100","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DS007-FAT-BUS","- di cui conseguito sul segmento business"],
        ["110","Fatturato da contratti di noleggio per tipologia di funzione/motivo di utilizzo","DS008-FAT-REP","- di cui realizzato sul segmento replacement"],
        ["120","Fatturato da contratti di noleggio per tipologia veicolo","DS001-FAT-TOT","Fatturato da contratti di noleggio totale"],
        ["130","Fatturato da contratti di noleggio per tipologia veicolo","DS009-FAT-VET","- di cui realizzato su vetture"],
        ["140","Fatturato da contratti di noleggio per tipologia veicolo","DS010-FAT-FUR","- di cui realizzato su furgoni"],
        ["150","Giorni di noleggio per tipologia veicolo","DS011-GIO-TOT","Giorni di noleggio totali"],
        ["160","Giorni di noleggio per tipologia veicolo","DS012-GIO-VED","- di cui vetture "],
        ["170","Giorni di noleggio per tipologia veicolo","DS014-GIO-FUD","- di cui furgoni "],
        ["180","Giorni di noleggio per tipologia location","DS011-GIO-TOT","Giorni di noleggio totali"],
        ["190","Giorni di noleggio per tipologia location","DS016-GIO-APT","- di cui realizzato presso aeroporti"],
        ["200","Giorni di noleggio per tipologia location","DS017-GIO-DOW","- di cui realizzato su location downtown"],
        ["210","Numero di noleggi per tipologia veicolo","DS018-NOL-TOT","N° di noleggi totali"],
        ["220","Numero di noleggi per tipologia veicolo","DS019-NOL-VED","- di cui vetture "],
        ["230","Numero di noleggi per tipologia veicolo","DS021-NOL-FUD","- di cui furgoni"],
        ["240","N° di noleggi per tipologia location","DS018-NOL-TOT","Numeri di noleggi totali"],
        ["250","N° di noleggi per tipologia location","DS023-NOL-APT","- di cui presso aeroporti"],
        ["260","N° di noleggi per tipologia location","DS024-NOL-DOW","- di cui su location downtown"],
        ["270","Durata media per tipologia veicolo","DS037-DUR-TOT","Durata media totale"],
        ["280","Durata media per tipologia veicolo","DS038-DUR-VED","- di cui vetture "],
        ["290","Durata media per tipologia veicolo","DS040-DUR-FUD","- di cui furgoni "],
        ["300","Flotta media per tipologia veicolo","DS042-FLM-TOT","Flotta media totale"],
        ["310","Flotta media per tipologia veicolo","DS043-FLM-VED","- di cui vetture "],
        ["320","Flotta media per tipologia veicolo","DS045-FLM-FUD","- di cui furgoni"],
        ["330","N° immatricolazioni per tipologia veicolo","DS058-IMM-TOT","Immatricolazioni totali"],
        ["340","N° immatricolazioni per tipologia veicolo","DS059-IMM-VET","- di cui vetture"],
        ["350","N° immatricolazioni per tipologia veicolo","DS060-IMM-FUR","- di cui furgoni"],
        ["360","N° di auto acquisite in leasing e noleggio (non immatricolate)","DS061-ACQ-TOT","Acquisizioni totali "],
        ["370","N° di auto acquisite in leasing e noleggio (non immatricolate)","DS062-ACQ-VET","- di cui vetture"],
        ["380","N° di auto acquisite in leasing e noleggio (non immatricolate)","DS063-ACQ-FUR","- di cui furgoni"],
        ["390","N° furti per tipologia veicolo","DS067-FUR-TOT","Numero di furti totali"],
        ["400","N° furti per tipologia veicolo","DS068-FUR-VET","- di cui vetture"],
        ["410","N° furti per tipologia veicolo","DS069-FUR-FUR","- di cui furgoni"],
        ["420","N° veicoli recuperati da furti per tipologia veicolo","DS070-VRF-TOT","Numero di veicoli recuperati da furti totali"],
        ["430","N° veicoli recuperati da furti per tipologia veicolo","DS071-VRF-VET","- di cui vetture"],
        ["440","N° veicoli recuperati da furti per tipologia veicolo","DS072-VRF-FUR","- di cui furgoni"],
        ["450","N° appropriazioni indebite","DS073-APP-TOT","Numero di appropriazioni indebite totali"],
        ["460","N° appropriazioni indebite","DS074-APP-VET","- di cui vetture"],
        ["470","N° appropriazioni indebite","DS075-APP-FUR","- di cui furgoni"],
        ["480","N° veicoli recuperati da appropriazioni indebite per tipologia veicolo","DS076-VRA-TOT","Numero di veicoli recuperati da appopriazioni indebite totali"],
        ["490","N° veicoli recuperati da appropriazioni indebite per tipologia veicolo","DS077-VRA-VET","- di cui vetture"],
        ["500","N° veicoli recuperati da appropriazioni indebite per tipologia veicolo","DS078-VRA-FUR","- di cui furgoni"]].each do |ff|
      l=s.survey_template_lines.build
      l.progressivo= ff.shift
      l.gruppo= ff.shift
      l.codice=ff.shift
      l.domanda=ff.shift
      l.um="N"
      l.tipo_dato="numerico"
      l.save
        end
  end
end
