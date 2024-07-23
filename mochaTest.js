const Mocha = require('mocha');
const mochaJUnitReporter = require('mocha-junit-reporter');

// Créer une nouvelle instance de Mocha
const mocha = new Mocha({
    reporter: mochaJUnitReporter,
    reporterOptions: {
        mochaFile: 'junit-results.xml'  // Nom du fichier où les résultats JUnit seront enregistrés
    }
});

// Ajouter les fichiers de test à exécuter
mocha.addFile('test/test1.js');
mocha.addFile('test/test2.js');
// Ajouter d'autres fichiers de test si nécessaire

// Exécuter les tests
mocha.run(failures => {
    process.exitCode = failures ? 1 : 0;  // Mettre à jour le code de sortie de Node.js en fonction des échecs de test
});

////test