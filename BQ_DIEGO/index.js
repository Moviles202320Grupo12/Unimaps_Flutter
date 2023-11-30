import { initializeApp} from 'https://www.gstatic.com/firebasejs/10.4.0/firebase-app.js';
import {getDocs, collection, getFirestore, query, where, orderBy  } from 'https://www.gstatic.com/firebasejs/10.4.0/firebase-firestore.js';

const firebaseApp = initializeApp({
    apiKey: "AIzaSyBacjt0qcN32DPCK4_Q189wjMSuNsXD0TA",
    authDomain: "stuzone-8afd7.firebaseapp.com",
    projectId: "stuzone-8afd7",
    storageBucket: "stuzone-8afd7.appspot.com",
    messagingSenderId: "511658793244",
    appId: "1:511658793244:web:f75dd5dca6ad5bac13c2d9",
    measurementId: "G-KH4DCPV26M"
  });

  const db = getFirestore(firebaseApp);
// Consulta para la colección "lostproperty"
const lostPropertyCollection = collection(db, 'lostproperty');
const lostPropertySnapshot = await getDocs(lostPropertyCollection);
const countLostProperty = lostPropertySnapshot.size;

// Consulta para la colección "foundproperty"
const foundPropertyCollection = collection(db, 'foundproperty');
const foundPropertySnapshot = await getDocs(foundPropertyCollection);
const countFoundProperty = foundPropertySnapshot.size;

// Ahora, tienes los conteos de ambas colecciones y puedes representar la proporción en un gráfico de pastel
const ctxPie = document.getElementById('pieChart').getContext('2d');

const pieChart = new Chart(ctxPie, {
    type: 'pie',
    data: {
        labels: ['Lost Property', 'Found Property'],
        datasets: [{
            label: 'Proporción de Registros',
            data: [countLostProperty, countFoundProperty],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)', // Color para Lost Property
                'rgba(54, 162, 235, 0.2)' // Color para Found Property
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)', // Borde para Lost Property
                'rgba(54, 162, 235, 1)' // Borde para Found Property
            ],
            borderWidth: 1
        }]
    },
    options: {
        // Puedes añadir opciones adicionales aquí si lo necesitas
    }


});
