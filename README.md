### Lien
 https://thp-nantes-boutique.herokuapp.com/ 

### Le Projet
Vous n'avez jamais éprouvé ce besoin irrésistible de vous extasier devant un chaton mignon tout plein?
Malheureusement dans ces moments là, impossible de trouver de belles photos de qualité... Il n'existait jusqu'à maintenant aucune offre de service digne de ce nom sur le marché. 
Chez Atomic Kitten, nous travaillons avec les plus grandes agences de mannequinat chat et nous avons sélectionné les meilleures modèles pour vous, pour fournir à nos clients LA boutique photo de référence sur les chatons.

### L'équipe
Notre dream-team de Nantes est composée de:
  - Bertyn
  - Florian
  - Lionel
  - Mohamed
  - Nicolas

> Dédicace au Lieu Unique, à la Fac de Sciences et à nos ordis qui en ont marre, sans qui tout celà n'aurait pas été possible.

Ready ? Installes-toi, prends un café pour pas t'endormir... euh pour te booster et c'est parti !

### Méthodologie et répartition
 ##### To do
 - [1] Un dossier Github qui contient une application Rails qui contient tout
 - [2] Un README.md qui explique toute l'application, comment s'en servir, les différents liens de production, les opérations utilisées, etc
 - [3] Du Front
 - [4] Du Back-end
 - [5] Du Devise
 - [6] Du Mailjet
 - [7] Du Stripe
 - [8] De l'Active Storage
 - [9] Quelques tests : regarde Capybara pour les tests d'intégrations
 - ...

| Membre | Poste  | Partie  | Taf  |
| ------ | ------ | ------ | ------ |
| Bertyn | pivot (center) | [1], [4], [7] | Stripe hero |
| Florian | meneur (point guard)| [1], [3], [4], [5], [6]| Lead developper |
| Lionel | ailier (small forward)]| [1], [2], [6]| Mailjet warrior|
| Mohamed |arrière (shooting guard) | [1], [3], [5] | Mage des gems et css |
| Nicolas | ailier fort (power forward)| [1], [4], [5]| Doctor Bugs & test |

### Ressources

ruby '2.5.1'
rails '5.2.1'

* [Rails](https://rubyonrails.org/) - On ne le presente plus

### Gemfile

| gem | info  |
| ------ | ------ |
| gem 'bootstrap' |  |
| gem 'jquery-rails' | |
| gem 'devise' | |
| gem 'dotenv-rails' | |
| gem 'stripe' | |

# Lancement :
```sh
$ git clone https://github.com/FloLeh/boutique-photos
$ bundle install
$ rails db:create
$ rails db:migrate
```
