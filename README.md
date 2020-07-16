Projet scrappeur fou -- formation THP
==========
fait par Sami
----------

### Partie 1: Dark Trader
source: 
le site CoinMarketCap
https://coinmarketcap.com/all/views/all/
consigne:
récupère le cours de toutes les cryptomonnaies et les enregistre dans un array de hashs 
suivant le modèle suivant: 
a = [
  { "BTC" => 5245.12 },
  { "ETH" => 217.34 }, 
  etc
]
(a est un array de mini hash, chaque hash a le comportement d'un enregistrement
dont la key est le nom de la crypto et la valeur est la valeur/cours)

effectue des tests sur:
1) le fonctionnement de base du programme -> pas d'erreur et pas de retour vide ou nil
2) le programme sort bien un array cohérant (vérifier la présence de trois cryptomonnaies
   vérifier que l'array est de taille cohérente, etc.)

Aide:
Programme n'allant que sur une seule URL (pour plus de rapidité)

XPath pertinent et précis qui extrait juste ce qu'il faut d'éléments HTML
puis, un bon traitement de ces éléments pour en extraire les 2 infos dont on a besoin:
le nom des crypto et leurs cours.

programme qui scrappe en indiquant ce qu'il fait à l'aide de puts dans le terminal pour afficher
un message à chaque fois qu'il récupère une donnée.

variables bien nommées, array: crypto_name_array (de préférence) ou crypto_nameS

rappel: result = Hash.new et stocker result[ta_key] = ta_value

découper le programme en méthodes (25 lignes max par méthodes) et checker par le bot
vérifier et tester chaque méthode 
EXEMPLE:
1) isoler les élemnts HTML qui vont bien
2) en extraire le texte et mettre ça dans un hash
3) réorganiser ce hash dans un array de plusieurs mini-hash comme demandé 


## Parite 2: Mairie christmas
source: 
annuaire des mairies 
consigne:
récupère les adresses e-mails des mairies u Val d'Oise. Comme dans la partie 1, on devra enregistrer
les données dans dans un array de hash suivant ce format:
a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]

Aide:
décomposition du programme en 2 sous-problèmes simples:
1. obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairires)
faire d'avord une méthode get_townhall_email(townhall_url) à partir de l'URL de mairires 
(par exemple celle de Avernes)
2. répéter ça sur tout l'annuaire du Val d'Oise.
3. coder une méthode get_townhall_rls qui récupère les URLs de chaque ville du Val d'Oise
(imbirquer les deux méthodes + tests)

## Partie 3: Cher député 
source:
site à trouver 
tu dois récupérer la liste complère des députés de France anisi que leurs adresses email
stocker les infos dans un array de hash suivant ce format:
a = [
  { 
    "first_name" => "Jean",
    "last_name" => "Durant",
    "email" => "jean.durant@assemblée.fr"
  },
  { 
    "first_name" => "Martin",
    "last_name" => "Dupont",
    "email" => "martin.dupont@assemblée.fr"
  },
  etc
]
+ tests (2 minimum)

## rendu
3 fichiers de scrapping dans lib, 3fichiers tests pour chacun dans spec, un fichier Gemfile, README qui explique tout.


