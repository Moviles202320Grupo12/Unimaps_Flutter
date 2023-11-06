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
  const cupones = collection(db, 'cupones');
  const q = query(cupones, where("reclamados", ">", 0), orderBy("reclamados", "asc"));

  const valoresReclamados = [];
const nombresCupones = [];
// Obtiene los documentos que cumplen con la consulta
const querySnapshot = await getDocs(q);

// Recorre los documentos y muestra el atributo "reclamados"
querySnapshot.forEach((doc) => {
  const data = doc.data();
  const valorReclamado = data.reclamados;
  const nombreCupon = data.title; // Reemplaza "nombre" por el campo relevante
  valoresReclamados.push(valorReclamado);
  nombresCupones.push(nombreCupon);
  console.log("Valor de 'reclamados':", data.reclamados);
  console.log('Valores Reclamados:', valoresReclamados);
  console.log('Nombres de Cupones:', nombresCupones);


});

const ctx = document.getElementById('barChart').getContext('2d');

        const barChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: nombresCupones,
                datasets: [{
                    label: 'Cupones Reclamados',
                    data: valoresReclamados,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });