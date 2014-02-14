Journalistieke database
=================
Het doel van dit project is het bouwen van een jounalistieke database, waarin alle onderwerpen en uitzendingen net en overzichtelijk opgeslagen worden. In de app kan men vervolgens nieuwe ideeën, uitzendingen en onderwerpen toevoegen en aanpassen. 


Features:
* Afleveringen toevoegen, aanpassen en een overzicht hiervan tonen
* Agenda
* Verschillende toestemmingen voor gebruikers
* Overzichten overzetten naar excel/pdf bestand
* Mogelijk tot groepsmail versturen naar alle betrokkenen
* Simpel/Intuïtief
* Veilig

Framewors, languages and libraries:
* Ruby on Rails
* HTML
* CSS

  # clone repo
  git clone www.github.com/Kuiteland/Journalistiek-app

  # make sure all gems are there
  cd Journalistiek-app
  bundle

  # initialize and seed database
  rake db:setup

  # start server
  rails s
