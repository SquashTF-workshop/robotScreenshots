Ce projet est composé de 4 cas de tests permettant de générer des captures d'écrans dans des scénarios différents.

Ces captures sont faites via la librairie Selenium de Robot Framework. Les tests sont eux exécutés sous Firefox.

Par défaut, lorsqu'aucun nom n'est spécifié, les captures via cette librairie sont enregistrées à l'emplacement des logs
et sont nommées suivant le format suivant :

selenium-screenshot-${id_incremental}.png

Les cas de tests disponibles sont les suivants :

Take Default Screenshot : Le test parcourt la documentation du JUnit Runner et effectue 2 captures.
Ces captures sont faites avec aucun paramètre. Ils sont donc enregistré à l'emplacement des logs avec le nom par défaut

Take Screenshot In Custom Path : Le test parcourt la documentation Robot Framework et effectue 2 captures.
L'emplacement des captures est modifié pour pointer sur le dossier target/customPath. On conserve cependant le nommage par défaut.

Take Screenshot In Custom Path With Specific Names : Le test parcourt la documentation Cucumber et effectue 2 captures.
L'emplacement des captures est modifié pour pointer sur le dossier target/customNames. On modifie également le nom des captures
avec la première sous 'firstMenu.png' et la seconde sous 'secondMenu.png'.

Take Screenshot After Keyword Failure : Le test accède via l'interface à la documentation de l'Execution Server puis vérifie
qu'un certain élément n'est pas présent. Le test part forcément en erreur ce qui déclenche une capture d'écran
(grâce au keyword Register Keyword To Run On Failure). Celle-ci est enregistrée dans le dossier target/errors