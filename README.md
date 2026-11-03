# Benuanta City

Kota virtual isometrik yang hidup 24 jam. Warga sekolah dan bekerja di siang hari, lalu nonton dan nongkrong di malam hari. Karakter tetap beraktivitas walaupun pemainnya sedang offline. Warga bisa mengejar karier sampai Tier 5 (kursinya hanya satu), mengumpulkan uang, membeli rumah, mencari teman di Cafe, dan menantang mereka duel.

![Enggo, Walikota Benuanta](media/Enggo_maskot.png)

**Enggo** adalah maskot sekaligus Walikota Benuanta. Video teaser vertikal 45 detik ada di [`media/Benuanta_Teaser_Enggo.mp4`](media/Benuanta_Teaser_Enggo.mp4).

## Status pengembangan

| Tahap | Isi | Status |
|---|---|---|
| 1–6 | Peta isometrik, gedung, warga, KTP & PIN, pekerjaan, hiburan, rumah | Selesai |
| 7 | 5 minigame, siklus tier mingguan, billboard, proyek Kantor Walikota, tugas profesi | Sedang diuji |
| 8 | Cafe (40 kursi, obrolan, sapa, duel Suit / Tic Tac Toe / Adu Hitung) | Cafe sudah diuji |
| 8 (lanjutan) | Ponsel (teman, DM, broadcast, lowongan), duel Tier 5 dengan bank soal, lelang Landmark | Belum |

Rancangan lengkapnya ada di dokumen "Dokumen Master Desain Benuanta City" (Claude Docs).

## Isi repo

```
benuanta-city.html   seluruh game dalam satu file (HTML + CSS + JavaScript)
media/               maskot Enggo dan video teaser
tools/               skrip bantu untuk menjalankan game di luar Claude
```

Game memakai [PixiJS 7.4.2](https://pixijs.com/) (dimuat dari CDN jsDelivr) untuk peta isometrik dan font Plus Jakarta Sans dari Google Fonts.

## Cara menjalankan

### 1. Sebagai artifact Claude (versi utama)

`benuanta-city.html` adalah sumber artifact Claude. Di sana game memakai kemampuan runtime `db` (data kota dan warga bersama) dan `user` (siapa pemilik kota). Semua pemain berbagi satu kota, dan data tersimpan permanen.

### 2. Di browser biasa (mode demo lokal)

Tanpa runtime Claude, game otomatis berjalan dalam **mode lokal**: kota bisa dicoba, tetapi data hanya ada di memori dan hilang saat halaman ditutup.

```bash
./tools/build-local.sh          # membuat dist/index.html
python3 -m http.server -d dist 8080
# buka http://localhost:8080
```

Skrip itu membungkus file game dengan kerangka HTML lengkap (`<!doctype html>`, charset, viewport). Kerangka ini biasanya ditambahkan otomatis oleh Claude saat artifact dipublikasikan.

## Catatan teknis singkat

- **Waktu:** 1 menit game = 500 ms nyata. Hari nyata berganti pukul 04.00 WITA, dan minggu dimulai Senin pukul 04.00 WITA.
- **Penyimpanan (runtime `db`):** dokumen `city/map`, `city/treasury`, `city/cycle`, `city/projects`, `city/stats`, `city/config`, serta koleksi `citizens`, `private`, dan `chat`.
- **Privasi:** Saldo warga bersifat pribadi dan hanya ditampilkan saat sesi PIN aktif.
- **Tier:** kursi diisi harian dari tier di bawahnya, lalu ada promosi/demosi mingguan. Tier 5 hanya punya satu kursi per profesi.
