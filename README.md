# FitManager

Mobilna aplikacija za digitalizaciju poslovanja teretane.

- **mobile/** – Flutter aplikacija (Dart, Material 3, Provider, go_router, Dio)
- **server/** – REST API (Node.js, Express.js, MongoDB, Mongoose, JWT)

## Pokretanje

### Server

```bash
cd server
npm install
cp .env.example .env   # pa upisati JWT_SECRET
npm run dev
```

Provjera: `http://localhost:5000/api/health`

### Mobilna aplikacija

```bash
cd mobile
cp .env.example .env
flutter pub get
flutter run
```

Na Android emulatoru API je dostupan na `http://10.0.2.2:5000/api`. Na fizičkom uređaju u `.env` treba upisati lokalnu IP adresu računara.

## Autor

David Lazić, IT64-2024 – Mobilne informacione tehnologije, FTN Novi Sad
