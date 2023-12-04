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

const tutorsCollection = collection(db, 'tutors');
const tutorsSnapshot = await getDocs(tutorsCollection);
const tutorsData = [];
tutorsSnapshot.forEach((doc) => {
    tutorsData.push({
        id: doc.id,
        ...doc.data()
    });
});

const consultasData = tutorsData.map((tutor) => tutor.llamadas);

// Crear el gráfico de barras
const ctxBar = document.getElementById('barChart').getContext('2d');

const barChart = new Chart(ctxBar, {
    type: 'bar',
    data: {
        labels: tutorsData.map((tutor) => tutor.name), // Utiliza los IDs de los documentos como etiquetas
        datasets: [{
            label: 'Llamadas por tutor',
            data: consultasData, 
            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Color de las barras
            borderColor: 'rgba(75, 192, 192, 1)', // Borde de las barras
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true // Inicia el eje y desde cero
            }
        }
    }
});

