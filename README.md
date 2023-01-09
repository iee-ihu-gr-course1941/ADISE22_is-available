# ADISE22_is-available
![Dominoes](https://user-images.githubusercontent.com/73245022/207955179-58c56368-f746-4877-9ef7-9947786439f5.JPG)

## **Περιεχόμενα**
1. [Σελίδα παιχνιδιου](#Μπορείτε-να-βρείτε-την-υλοποίηση-του-παιχνιδιού-στην-σελίδα)
2. [Περιγραφή τι αναπτύχθηκε και τι όχι](#Περιγραφή-τι-αναπτυχθηκε-και-τι-οχι)
3. [Περιγραφή API](#Περιγραφή-API)
4. [SQL](#SQL)

## Μπορείτε να βρείτε την υλοποίηση του παιχνιδιού στην σελίδα https://users.it.teithe.gr/~it185192/ADISE22_is-available/www/index.html

## **Περιγραφή παιχνιδιού**

Το Dominoes είναι ένα κλασικό παιχνίδι δύο παικτών, στο οποίο οι παίκτες πρέπει να τοποθετήσουν όλα τα ντόμινο τους στο τραπέζι, πριν από των αντίπαλο τους, για να κερδίσουν. Στην αρχή του παιχνιδιού από τα συνολικά 28 ντόμινο ο κάθε παίκτης  παίρνει 7 και τα υπόλοιπα τοποθετούνται στο μέρος που ονομάζεται "boneyard". Ο παίκτης που έχει το μεγαλύτερο διπλό (6-6, 5-5,4-4,...) παίζει πρώτος. Στην σπάνια περίπτωση που κανένας παίκτης δεν έχει κάποιο διπλό, τότε ξεκινάει ο παίκτης με το μεγαλύτερο άθροισμα. Στη συνέχεια, σειρά έχει ο δεύτερος παίκτης, ο οποίος μπορεί να τοποθετήσει ένα ντόμινο εφόσον έχει μία άκρη που ταιριάζει στο ντόμινο που παίχτηκε. Κατά την διάρκεια του παιχνιδιού αν κάποιος παίκτης δεν έχει κάποιο ντόμινο που να ταιριάζει θα πρέπει να τραβήξει ένα από το "boneyard" μέχρι να βρει ένα που να μπορεί να ταιριάξει.

## **Περιγραφή τι αναπτύχθηκε και τι όχι**

### Αναπτύχθηκε

- Αρχικοποίηση σύνδεσης-authentication.
- Έλεγχος κανόνων παιχνιδιού.
- Το APΙ χρησιμοποιεί json μορφή για τα δεδομένα.
- Η κατάσταση του παιχνιδιού αποθηκεύεται πλήρως σε mysql.
- Ο πρώτος παίκτης αρχικοποιεί το board και περιμένει αντίπαλο όπου χρειάζεται.

### Δεν Αναπτύχθηκε

- Η αναγνώριση σειράς παιξιάς γιατί ο παίκτης που παίζει δεν έχει την δυνατότητα να δει αρά να χρησιμοποιήσει τα ντόμινο του αντιπάλου.
- Η αναγνώριση DeadLock δεν υπάρχει κίνηση ή τέλος παιχνιδιού ή το παιχνίδι έχει μπλοκαριστεί.
- Πολλά σύγχρονα boards έγινε προσπάθεια αλλά απέτυχε (του ίδιου παιχνιδιού).
- Η επιλογή για τοποθέτηση του ντόμινου αριστερά ή δεξιά στην περίπτωση που το ντόμινο που θέλουμε να χρησιμοποιήσουμε είναι ίδιο και με τα δυο άκρα. 

### Προβλήματα στην εφαρμογή 

- Τα ντόμινο που χρησιμοποιούμε μπαίνουν στην ιδιά γραμμή με αποτέλεσμα να μην φαίνονται **πρόχειρη λύση** είναι η χρήση της μεγέθυνσης του προγράμματος περιήγησης.
- Μερικές φορές το κενό ντόμινο δηλαδή το 0 είναι προβληματικό όταν πρέπει να το χρησιμοποιήσουμε.
- Μερικές φορές τα χρησιμοποιημένα ντόμινο δεν εμφανίζονται σωστά.

## **Περιγραφή API**

### **players**

| URI | Method | Ενέργεια |
| ----------- | ----------- | ----------- |
|/players/ |PUT| Παίρνει το όνομα του χρηστή και αν δεν υπάρχει στον πίνακα players τότε εμφανίζει το κατάλληλο μήνυμα|
|/players/ |POST| Παίρνει το όνομα του χρηστή και αν υπάρχει στον πίνακα players τότε εμφανίζει το κατάλληλο μήνυμα αλλιώς το εισάγει|
|/players/ |GET| Παίρνει το id από το πάρτι και επιστρέφει τα χαρακτηρίστηκα των παικτών|
||

### **party**

| URI | Method | Ενέργεια |
| ----------- | ----------- | ----------- |
|/party/ |GET| Επιστρέφει της εγγραφές από τον πίνακα party|
|/party/ |POST| Δημιουργεί μια νέα εγγραφή στον πίνακα party|
|/party/ |PUT| Εισάγει ένα παίκτη σε μια εγγραφή του πίνακα party|
||

### **game**

| URI | Method | Ενέργεια |
| ----------- | ----------- | ----------- |
|/game/ |POST| Ελέγχει αν οι παίκτες είναι περισσότεροι από δυο αν είναι τότε καλεί την μέθοδο start_game και επιστρέφει τον πίνακα temp αν δεν είναι τότε εμφανίζει το κατάλληλο μήνυμα|
|/game/ |PUT| Καλεί την μέθοδο domino και επιστρέφει τον πίνακα temp|
|/game/ |GET| Καλεί την μέθοδο boneyard και επιστρέφει τον πίνακα temp|
||

## **SQL**

Το σχέδιο για την SQL ήταν να έχουμε: 
- έναν πίνακα για τους παίκτες με τα χαρακτηρίστηκα τους οπού θα γίνεται και η αυθεντικοποίηση
- έναν πίνακα με τα πάρτι όπου ένας παίκτης αφού συνδεθεί στο παιχνίδι να μπορεί να δημιουργήσει ένα πάρτι ή να συμμετέχει σε ένα είδη υπάρχων
- έναν πίνακα που θα αποθηκεύει για κάθε ντόμινο τον συνδυασμό id με το πλήθος από κουκίδες της κάθε πλευράς του ντόμινου
- έναν πίνακα για το παιχνίδι όπου αν το πάρτι έχει τον κατάλληλο αριθμό να δημιουργείτε μια εγγραφή και να περιέχει στα πεδία του τα id από τα ντόμινο
- έναν προσωρινό πίνακα που θα εμφανίζει τα ντόμινο του παίκτη που παίζει, τα ντόμινο που είναι χρησιμοποιημένα και τα ντόμινο του αντίπαλου χωρίς να φαίνονται
- έναν πίνακα που θα αποθηκεύει τα δυο άκρα που μπορεί ο παίκτης να βάλει τα ντόμινο

![20230106](https://user-images.githubusercontent.com/73245022/211217327-11f3b03e-10bc-457e-8a59-4769f73f188d.png)

### **Tables**

#### **dominoes**

Το dominoes είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:
| Attribute | Description | Values |
| ----------- | ----------- | ----------- |
|id | Το id του ντόμινου που είναι το κύριο κλειδί | 0...27 |
|domino | Ένας διψήφιος αριθμός που κάθε ψηφίο δείχνει το πλήθος από κουκίδες του ντόμινου για κάθε πλευρά με εξαίρεση το κενό ντόμινο που είναι ένας μονοψήφιος αριθμός δηλαδή το 0. | 0, 10, 11, 20, 21, 22, 30, 31, 32, 33, 40, 41, 42, 43, 44, 50, 51, 52, 53, 54, 55, 60, 61, 62, 63, 64, 65, 66 |
||

#### **game**

Το game είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:
| Attribute | Description | Values |
| ----------- | ----------- | ----------- |
| id | Το id του παιχνιδιού που είναι κύριο κλειδί | 1... |
| partyid | Το id του πάρτι που είναι ξένο κλειδί που αναφέρεται στο πεδίο id του πίνακα party | 0,2,4,... |
| playerid | Το id του παίκτη που παίζει που είναι ξένο κλειδί που αναφέρεται στο πεδίο playerid του πίνακα party | 1... |
|status |Η κατάσταση του παιχνιδιού (Δεν υλοποιήθηκε)|-| 
|last change| Τελευταία αλλαγή/ενέργεια στα πεδία του παιχνιδιού |TIMESTAMP|  
|0|Το id του ντόμινου 0|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |  
|1|Το id του ντόμινου 10 |Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε | 
|2|Το id του ντόμινου 11|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|3|Το id του ντόμινου 20|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|4|Το id του ντόμινου 21|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|5|Το id του ντόμινου 22|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|6|Το id του ντόμινου 30|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|7|Το id του ντόμινου 31|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|8|Το id του ντόμινου 32|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|9|Το id του ντόμινου 33|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |    
|10|Το id του ντόμινου 40|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|11|Το id του ντόμινου 41|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|12|Το id του ντόμινου 42|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|13|Το id του ντόμινου 43|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|14|Το id του ντόμινου 44|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|15|Το id του ντόμινου 50|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|16|Το id του ντόμινου 51|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|17|Το id του ντόμινου 52|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|18|Το id του ντόμινου 53|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|19|Το id του ντόμινου 54|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|20|Το id του ντόμινου 55|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|21|Το id του ντόμινου 60|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|22|Το id του ντόμινου 61|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|23|Το id του ντόμινου 62|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|24|Το id του ντόμινου 63|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|25|Το id του ντόμινου 64|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|26|Το id του ντόμινου 65|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε |   
|27|Το id του ντόμινου 66|Το id του παίκτη που κατέχει το ντόμινο ή η default τιμή 'boneyard' ή η τιμή 'usedxxx' όπου το πρώτο x είναι με ποια σειρά χρησιμοποιήθηκε το ντόμινο δηλαδή 0,1,2... το δεύτερο x είναι η κατεύθυνση δηλαδή αν είναι 1 είναι δεξιά αν είναι 0 είναι αριστερά και το τρίτο x είναι η περιστροφή δηλαδή αν είναι 1 τότε το αντιστρέφουμε κατά 180 μοίρες αν είναι 0 δεν το αντιστρέφουμε | 
||  

#### **party**

Το party είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:
| Attribute | Description | Values |
| ----------- | ----------- | ----------- |
| id | Το id του πάρτι που είναι κύριο κλειδί | 0... |
|playerid| Το id του παίκτη που είναι ξένο κλειδί που αναφέρεται στο πεδίο id του πίνακα players|1...|
|| 

#### **players**

Το players είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:
| Attribute | Description | Values |
| ----------- | ----------- | ----------- |
| id | Το id του παίκτη που είναι κύριο κλειδί | 0... |
|username | Όνομα παίκτη | VARCHAR |
|token| Το κρυφό token του παίκτη. (δεν χρησιμοποιείτε πουθενά)| VARCHAR| 
||

#### **start_end**

Ο start_end είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:
| Attribute | Description | Values |
| ----------- | ----------- | ----------- |
| startD | Πως ξεκινάει το ντόμινο δηλαδή το πρώτο ψηφίο| 0...6 |
|endD| Πως τελειώνει το ντόμινο δηλαδή το δεύτερο ψηφιο|0...6|
||

#### **temp**

Ο temp είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:
| Attribute | Description |
| ----------- | ----------- | 
| tempcolumn | Το πλήθος τον ντόμινων που έχει ο αντίπαλος, τα ντόμινο που έχει ο παίκτης που παίζει, τα ντόμινο που έχουν χρησιμοποιηθεί  |
|gameid | Το id του παιχνιδιού | 
||

### **Stored Procedures** 

| Name | IN/OUT/INTOUT Parameters | Description |
| ----------- | ----------- | ----------- | 
|back_to_default| IN gameid Το id του παιχνιδιού | Θέτει σε όλα τα id από τα ντόμινο του πίνακα game την default τιμή 'boneyard'. Θα χρησιμοποιούνταν όταν έχει τελείωση το παιχνίδι αλλά δεν υλοποιήθηκε αυτό το κομμάτι. |
|boneyard| IN gameid Το id του παιχνιδιού| Καλείται  όταν ο παίκτης δεν έχει ντόμινο που μπορεί να χρησιμοποίηση. Αρχικά βρίσκουμε ποιος παίκτης παίζει και μετα με μια random βρίσκουμε ένα ντόμινο και θέτουμε ότι το κατέχει ο παίκτης που παίζει, τέλος καλεί την emfanise_ta_plakidia_toy_pekti |
|domino| IN gameid Το id του παιχνιδιού, IN iddomino Το id του ντόμινου, OUT kati Το αποτέλεσμα της Procedure| Καλείται όταν ο χρήστης θέλει να χρησιμοποίηση ένα ντόμινο. Αρχικά βρίσκουμε πόσα ντόμινο έχουν χρησιμοποιηθεί μετα βρίσκουμε σε ποιο ντόμινο αντιστοιχεί το iddomino. Αν το πλήθος είναι μηδέν τότε θέτουμε στον πίνακα start_end για το πεδίο startD και endD τον αριθμό που ξεκινάει και τελειώνει το ντόμινο που βρήκαμε προηγούμενος αντίστοιχα και θέτουμε στης μεταβλητές κατεύθυνση και περιστροφή το 0. Αν το πλήθος είναι μεγαλύτερο του μηδέν τότε παίρνουμε το startD και το endD από τον πίνακα start_end και ελέγχουμε 1.Αν το startD είναι ίδιο με την αρχή του ντόμινου τότε θέτουμε στης μεταβλητές κατεύθυνση και περιστροφή το 0 και το 1 αντίστοιχα 2. Αν το startD είναι ίδιο με το τέλος του ντόμινου τότε θέτουμε στης μεταβλητές κατεύθυνση και περιστροφή το 0. 3.Αν το endD είναι ίδιο με την αρχή του ντόμινου τότε θέτουμε στης μεταβλητές κατεύθυνση και περιστροφή το 1 και το 0 αντίστοιχα 4. Αν το endD είναι ίδιο με το τέλος του ντόμινου τότε θέτουμε στης μεταβλητές κατεύθυνση και περιστροφή το 1. Αν έχουμε μπει σε ένα από τα παραπάνω if τότε θα θέσουμε στο iddomino σαν τιμή την usedxxx όπου το πρώτο x συμβολίζει το πλήθος των χρησιμοποιημένων, το δεύτερο x την κατεύθυνση και το τρίτο x την περιστροφή του ντόμινου. Στην συνέχεια βρίσκουμε τον επόμενο παίκτη που θα παίξει αλλά και ελέγχουμε αν ο παίκτης που έπαιξε έχει 0 ντόμινο στην κατοχή του αν ναι τότε είναι νικητής. Τέλος καλεί την emfanise_ta_plakidia_toy_pekti|
|emfanise_ta_plakidia_toy_pekti| IN gameid Το id του παιχνιδιού| Καλείται από την boneyard, domino και start_game. Αρχικά διαγραφεί τα περιεχόμενα από τον πίνακα temp μετα εισάγει στο πεδίο gameid το gameid μετα βρίσκει και εισάγει στο πεδίο tempcolumn το πλήθος από τα ντόμινο του παίκτη που δεν είναι η σειρά του, τα ντόμινο του παίκτη που παίζει και τέλος τα ντόμινο που έχουν χρησιμοποιηθεί.  |
|max_podi| IN gameid Το id του παιχνιδιού| Καλείται από την μέθοδο start_game. Βρίσκει και θέτει στο πεδίο playerid του πίνακα game τον παίκτη που κατέχει το ντόμινο με το μεγαλύτερο άθροισμα |
|megaliteroi_idioi_ariumi| IN gameid Το id του παιχνιδιού| Καλείται από την μέθοδο start_game. Βρίσκει και θέτει στο πεδίο playerid του πίνακα game τον παίκτη που κατέχει το ντόμινο με τους μεγαλύτερους ιδίους αριθμούς πχ 66,55,44,...|
|moirasma| IN gameid Το id του παιχνιδιού| Καλείται από την μέθοδο start_game. Για κάθε παίκτη βρίσκουμε στην τύχη 7 ντόμινο και θέτουμε το id του παίκτη |
|start_game| IN partyid Το id του πάρτι| Καλείται όταν ξεκινάει το παιχνίδι. Εισάγει ένα νέο παιχνίδι στο πίνακα game, καλεί την μέθοδο moirasma και megaliteroi_idioi_ariumi αν η μέθοδος megaliteroi_idioi_ariumi δεν βρει έναν παίκτη που να κατέχει ένα ντόμινο με ιδίους αριθμούς τότε καλεί και την max_podi τέλος καλεί την emfanise_ta_plakidia_toy_pekti|
||
