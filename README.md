# War-and-Peace
Il s'agit de créer une arène où deux héros pourront s'affronter.
## Les technologies utilisées:
- Ruby 2.6.2
- Rails 6.0.0
- Html5
- CSS3
- Bootstrap 4.2
- Node 10.16.0
- Git
- Postgresql 11.5 
#### Organisation
Gestion de projet via Github Tools (issues, projects) et utilisation de la méthode [Kanban](https://github.com/camilleregnault/war-and-peace/projects/1)

## Projet
Le but de ce challenge est de tester ta capacité à monter une petite application dans le respect des bonnes pratiques.
On te propose plusieurs étapes, avec des bonus facultatifs. Tu peux t'arrêter quand tu veux.
Tiens-nous régulièrement informés de ta progression.

Nous nous intéresserons tout particulièrement aux choix de conception que tu feras, comment tu abordes les fonctionnalités à développer et ta connaissance des outils que tu utilises.

## Installation:
- [Ruby 2.6 ou supérieur](https://www.ruby-lang.org/fr/documentation/installation/)
- [Rails 6.0 ou supérieur](https://guides.rubyonrails.org/v5.0/getting_started.html)
- [Rbenv](https://github.com/rbenv/rbenv) (Si plusieurs versions de Ruby sur le même environnement)
- [Node 10.16 ou superieur](https://nodejs.org/en/download/package-manager/)
- [Postgesql](https://www.postgresql.org/)
###### Cloner le repository:
```
git clone https://github.com/camilleregnault/war-and-peace.git
cd war-and-peace/
yarn install
bundle install
```
## Lancement:
###### Base de données :
```
rails db:setup
```
###### Cloudinary :
```
touch .env
echo '.env*' >> .gitignore
```
Ajouter la clé Clouninary dans le fichier .env ( CLOUDINARY_URL=cloudinary://*********************** )
###### Lancement de l’application :
```
rails s
```
Puis ouvrez **http://localhost:3000/** dans un navigateur pour utiliser l’application.

## Démo:
Projet hébergé sur [Heroku](https://www.heroku.com):

https://war-and-peace-game.herokuapp.com/

## Test:
###### Lancement des tests :
```
rails test
```

## Étapes
#### 1. Page d'accueil statique

C'est l'accueil de l'arène, d'où nous pourrons lancer les combats.
Le but est donc de créer l'application et d'afficher une page dans un navigateur. ✔️

##### Bonus :

- [x]  Un petit texte d'introduction de ton cru. C'est plus fun.
- [x]  Joli design (mais n'y perd pas trop de temps non plus)

#### 2. Pouvoir créer un personnage
##### Données requises :

- [x]  Nom
- [x]  Points de vie
- [x]  Points d'attaque
- [x]  Assure-toi qu'il n'y ait pas de grand déséquilibre entre combattants.

##### Bonus :

- [x]  L'arène n'est pas vide au premier démarrage de l'appli.
- [x]  Les persos ont une photo de profil (ou de face)
- [x]  Crud complet des personnages
- [ ]  Ajouter d'autres caractéristiques aux personnages

#### 3. READY? FIGHT!
Pouvoir choisir deux personnages et les faire combattre, puis afficher le gagnant avec un récapitulatif du combat. ✔️

##### Bonus :

- [x]  Historique des combats qui ont eu lieu
- [ ]  Ajout de points d'expérience (mais pourquoi faire ?)
- [ ]  Statistiques des combats : taux de victoire par perso et tout ça

#### 4. Des armes
Pouvoir assigner une arme aux personnages avant le combat. ✔️

##### Bonus :

- [x]  Il n'y a pas que les armes dans la vie, il y a des boucliers aussi
- [ ]  Pouvoir utiliser plusieurs équipements

#### Informations complémentaires
Oui, j'ai lu Guerre et Paix
