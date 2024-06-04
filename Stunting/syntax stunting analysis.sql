#DATA EXPLORATION
#Menampilkan 3 baris pertama Tabel karakteristik
SELECT * FROM stunting_a_3.karakteristik
LIMIT 3;
#Menampilkan 3 baris pertama Tabel faktor_resiko
SELECT * FROM stunting_a_3.faktor_resiko
LIMIT 3;
#Menampilkan 3 baris pertama Tabel riwayat
SELECT * FROM stunting_a_3.riwayat
LIMIT 3;

#Menggabungkan 3 tabel
SELECT stunting_a_3.karakteristik.Jenis,BBL,Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu,Tb_ibu,Umur_Bayi,
stunting_a_3.faktor_resiko.Energi,Protein,Sanitasi_Lingkungan,
stunting_a_3.riwayat.Status_Imunisasi,Riwayat_Penyakit,Stunting FROM stunting_a_3.karakteristik
JOIN stunting_a_3.faktor_resiko ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.faktor_resiko.Id_Responden 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden;

#Jumlah Bayi yang teridentifikasi stunting
SELECT COUNT(Stunting) FROM stunting_a_3.riwayat WHERE stunting_a_3.riwayat.Stunting = 'Stunting';

#Jumlah Bayi yang teridentifikasi tidak stunting
SELECT COUNT(Stunting) FROM stunting_a_3.riwayat WHERE stunting_a_3.riwayat.Stunting = 'Tidak Stunting';

#Data yang teridentifikasi Stunting
SELECT stunting_a_3.karakteristik.Jenis,BBL,Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu,Tb_ibu,Umur_Bayi,
stunting_a_3.faktor_resiko.Energi,Protein,Sanitasi_Lingkungan,stunting_a_3.riwayat.Status_Imunisasi,Riwayat_Penyakit,Stunting 
FROM stunting_a_3.karakteristik
JOIN stunting_a_3.faktor_resiko ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.faktor_resiko.Id_Responden 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden 
WHERE Stunting = 'Stunting';

#Data yang teridentifikasi Tidak Stunting
SELECT stunting_a_3.karakteristik.Jenis,BBL,Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu,Tb_ibu,Umur_Bayi,
stunting_a_3.faktor_resiko.Energi,Protein,Sanitasi_Lingkungan,stunting_a_3.riwayat.Status_Imunisasi,Riwayat_Penyakit,Stunting 
FROM stunting_a_3.karakteristik
JOIN stunting_a_3.faktor_resiko ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.faktor_resiko.Id_Responden 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden 
WHERE Stunting = 'Tidak Stunting';

#DATA ANALYSIS
#Faktor Ibu dan bbl bayi
SELECT stunting_a_3.karakteristik.BBL,Tb_Ibu,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' ORDER BY stunting_a_3.karakteristik.BBL ASC;

SELECT BBL,Tb_Ibu, count(Stunting) FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' GROUP BY BBL,Tb_Ibu
ORDER BY count(Stunting);

SELECT stunting_a_3.karakteristik.BBL,Tb_Ibu,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting' ORDER BY stunting_a_3.karakteristik.BBL ASC;

SELECT BBL,Tb_Ibu, count(Stunting) AS 'Tidak Stunting' FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting' GROUP BY BBL,Tb_Ibu
ORDER BY count(Stunting);

#faktor ekonomi
SELECT stunting_a_3.karakteristik.Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' ORDER BY stunting_a_3.karakteristik.Penghasilan_Ortu ASC;

SELECT Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu, count(Stunting) FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' GROUP BY Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu
ORDER BY count(Stunting);

SELECT stunting_a_3.karakteristik.Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting' ORDER BY stunting_a_3.karakteristik.Penghasilan_Ortu ASC;

SELECT Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu, count(Stunting) AS 'Tidak Stunting' FROM stunting_a_3.karakteristik
JOIN stunting_a_3.riwayat ON stunting_a_3.karakteristik.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting' GROUP BY Pekerjaan_Ortu,Pendidikan,Penghasilan_Ortu
ORDER BY count(Stunting);

#Faktor Gizi
SELECT stunting_a_3.faktor_resiko.Energi,Protein,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.faktor_resiko 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting'AND Energi ='Defisit Sedang' AND Protein = 'Defisit Sedang';

SELECT Energi, Protein, count(Stunting) FROM stunting_a_3.faktor_resiko
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' GROUP BY Energi, Protein
ORDER BY count(Stunting);

SELECT stunting_a_3.faktor_resiko.Energi,Protein,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.faktor_resiko 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting';

SELECT Energi, Protein, count(Stunting) AS 'Tidak Stunting' FROM stunting_a_3.faktor_resiko
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting' GROUP BY Energi, Protein
ORDER BY count(Stunting);

#Faktor Lingkungan
SELECT stunting_a_3.faktor_resiko.Sanitasi_Lingkungan,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.faktor_resiko 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting';

SELECT Sanitasi_Lingkungan, count(Stunting) FROM stunting_a_3.faktor_resiko
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' GROUP BY Sanitasi_Lingkungan
ORDER BY count(Stunting);

SELECT stunting_a_3.faktor_resiko.Sanitasi_Lingkungan,stunting_a_3.riwayat.Stunting 
FROM stunting_a_3.faktor_resiko 
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting';

SELECT Sanitasi_Lingkungan, count(Stunting) AS 'Tidak Stunting' FROM stunting_a_3.faktor_resiko
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Tidak Stunting' GROUP BY Sanitasi_Lingkungan
ORDER BY count(Stunting);

# Faktor Imunisasi dan Riwayat Penyakit
SELECT stunting_a_3.riwayat.Status_Imunisasi,Riwayat_Penyakit,Stunting FROM stunting_a_3.riwayat
WHERE Stunting = 'Stunting';

SELECT Status_Imunisasi,Riwayat_Penyakit, count(Stunting) FROM stunting_a_3.riwayat
WHERE Stunting = 'Stunting' GROUP BY Status_Imunisasi,Riwayat_Penyakit
ORDER BY count(stunting);

SELECT stunting_a_3.riwayat.Status_Imunisasi,Riwayat_Penyakit,Stunting FROM stunting_a_3.riwayat
WHERE Stunting = 'Tidak Stunting';

SELECT Status_Imunisasi,Riwayat_Penyakit, count(Stunting) AS 'Tidak Stunting' FROM stunting_a_3.riwayat
WHERE Stunting = 'Tidak Stunting' GROUP BY Status_Imunisasi,Riwayat_Penyakit
ORDER BY count(stunting);

#Faktor-faktor yang berpengarub terhadap kejadian stunting
SELECT stunting_a_3.faktor_resiko.Energi,Protein,Sanitasi_Lingkungan,stunting_a_3.riwayat.Riwayat_Penyakit,Stunting 
FROM stunting_a_3.faktor_resiko
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting';

SELECT Energi, Protein, Sanitasi_lingkungan,Riwayat_Penyakit, count(Stunting) FROM stunting_a_3.faktor_resiko
JOIN stunting_a_3.riwayat ON stunting_a_3.faktor_resiko.Id_Responden = stunting_a_3.riwayat.Id_Responden
WHERE Stunting = 'Stunting' GROUP BY Energi, Protein, Sanitasi_lingkungan,Riwayat_Penyakit
ORDER BY count(stunting) DESC;

