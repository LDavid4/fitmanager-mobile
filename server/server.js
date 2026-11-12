require('dotenv').config();
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');

const connectDB = require('./config/db');

const app = express();

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());

// Provjera rada servera
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', service: 'FitManager API' });
});

// Rute (dodaju se u narednim kontrolnim tackama)
// app.use('/api/auth', require('./routes/authRoutes'));

// Nepostojeca ruta
app.use((req, res) => {
  res.status(404).json({ message: 'Ruta nije pronadjena' });
});

const PORT = process.env.PORT || 5000;

connectDB().then(() => {
  app.listen(PORT, () => console.log(`Server pokrenut na portu ${PORT}`));
});
