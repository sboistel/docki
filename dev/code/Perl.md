[[_TOC_]]

---

Perl tips & tricks

## Variable

### Scalaire

Contenant une seule valeure :

> $

###  Liste

Example : ('Toto', 'Titi', 'Tata')

> @

### Hashs

Le type de la variable hashs 

> %

Example de hashs :

```PERL
my %liste = (
    Perl => 'Super',
    Python => 'Génial'
);

print ($liste{Python});
```

## Fonctions

## split

La fonction split permet de retirer un élèment séparateur :

> my @liste = split ' ', $liste_d_element

## join

La fonction join permet d'insérer un ou plusieurs élèment séparateur dans une liste d'élèment :

> my @liste = join '; ', @liste_d_element

### Pragma

Utiliser les pragma pour sécuriser son script.

## strict

Erreur de syntaxe, avoir un code propre

> use strict;

## warning

Avertissement d'erreur de syntaxe 

> use warning;

## Sucre de syntaxe

Afin d'éviter d'avoir un code illisible avec nos "" ou '', deux méthodes sont applicables dans chacun des cas.

### Guillement

Pour substituer "" :

> qq/Chaine de carractère/

### Guillement Simple

Pour substituer '' :

> q/Chaine de carractère/

### Liste

Pour substituer une liste (ex : ('Toto', 'Titi', 'Tata')) :

> qw/Toto Titi Tata/

### Here string

OEF signifiant fin de ligne permet d'englober un parragraphe de données :

```PERL
my $variable = <<OEF;
ligne 1 de données
ligne 2 de données
...
EOF
```

## Vérifications

### Prédica 'if'

Vérification de l'éxistance d'un élèment.

```PERL
use strict

my $langages = (
    Perl   => 'super',
    Python => 'geniale',
    Ruby   => 'ouais',
    Pascal => 'bof',
    C      => 'bof,
    'C ++' => 'bof'
);
if (exists $langages{Haskell})
{
    print ("Mon langage est ", $langages{Haskell}, "\n");
}
elsif (exists $langages{Perl})
(
    print ("Mon langage est ", $langages{Perl}, "\n");
)
else
{
    print "Haskell n'est pas défini !\n";
}
```

## Rendre son script intératif

### Standard input

Chop retire le dernier carractère

Chomp retire le dernier carractère seulement si celui-ci est un '\n'

Noté ``STDIN``, il sert à poser une question à l'utilisateur:

```PERL
use strict

my $langages = (
    Perl   => 'super',
    Python => 'geniale',
    Ruby   => 'ouais',
    Pascal => 'bof',
    C      => 'bof,
    'C ++' => 'bof'
);

print "Entrer le nom d'un langage : "
chomp (my $response = <STDIN>);

print ("$response est $langages{$response} !\n") 
if exists $langages{$response} or die "$response n'éxiste pas !\n";
```

## Boucles

### For || Foreach

For ou Foreach on la même signification

```PERL
use stric

my $langages = (
    Perl   => 'super',
    Python => 'geniale',
    Ruby   => 'ouais',
    Pascal => 'bof',
    C      => 'bof,
    'C ++' => 'bof'
);

print "Element : $_\n" for (sort keys %langages);
```

### while

Tant que quoi ?

```PERL
while(<STDIN>) {
    chomp;
    die "Fin." unless $_; # ou 'last unless $_;' pour quitter la boucle
    print "coucou $_";
}
```

### pseaudo case

La fonction case n'éxiste pas mais un bricolage est possible :

```PERL
print "Entrer un nombre entre 1 et 3 : ";
my $response = <STDIN>;

for ($response) {
    $_ == 1 && print "C'est un\n"
    $_ == 2 && print "C'est deux\n"
    $_ == 3 && print "C'est trois\n"
}
```

## Fichier

### Ouvrir un Fichier

'FILE' en majuscule -> Convention de Perl
- '<' = read only
- '>' = write only
- '+>' = read / write / del
- '>>' = add only
- '+>>' = read / write / add

Ouvrir un fichier avec :

    open FILE, '<'

## Librairies

## REST

### CLIENT

Comment afficher le token géneré :

> print $authToken->{'authToken'}, "\n";