-- tablolar başladı

-- Veli tablosu
CREATE TABLE veli (
    veli_id INT PRIMARY KEY IDENTITY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    adres VARCHAR(255),
    telefon_no VARCHAR(15)
);

-- Şube tablosu
CREATE TABLE şube (
    şube_id INT PRIMARY KEY IDENTITY,
    şube_adı VARCHAR(50) NOT NULL
);

-- Sınıf tablosu
CREATE TABLE sınıf (
    sınıf_id INT PRIMARY KEY IDENTITY,
    şube_id INT NOT NULL,
    sınıf_adı VARCHAR(50),
    FOREIGN KEY (şube_id) REFERENCES şube(şube_id)
);

-- Öğretmen tablosu
CREATE TABLE öğretmen (
    öğretmen_id INT PRIMARY KEY IDENTITY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    adres VARCHAR(255),
    telefon_no VARCHAR(15),
    branş VARCHAR(50)
);

-- Ders tablosu
CREATE TABLE ders (
    ders_id INT PRIMARY KEY IDENTITY,
    öğretmen_id INT NOT NULL,
    ders_adı VARCHAR(100) NOT NULL,
    kredi INT NOT NULL,
    FOREIGN KEY (öğretmen_id) REFERENCES öğretmen(öğretmen_id)
);

-- Yönetici tablosu
CREATE TABLE yönetici (
    yönetici_id INT PRIMARY KEY IDENTITY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    adres VARCHAR(255),
    telefon_no VARCHAR(15),
    görev VARCHAR(50)
);

-- Öğrenci tablosu
CREATE TABLE öğrenci (
    öğrenci_id INT PRIMARY KEY IDENTITY,
    sınıf_id INT NOT NULL,
    veli_id INT NOT NULL,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    doğum_tarih DATE,
    adres VARCHAR(255),
    telefon_no VARCHAR(15),
	cinsiyet VARCHAR(10),
    FOREIGN KEY (sınıf_id) REFERENCES sınıf(sınıf_id),
    FOREIGN KEY (veli_id) REFERENCES veli(veli_id)
);

-- Sınav tablosu
CREATE TABLE sınav (
    sınav_id INT PRIMARY KEY IDENTITY,
    ders_id INT NOT NULL,
    sınav_türü VARCHAR(50),
    FOREIGN KEY (ders_id) REFERENCES ders(ders_id)
);

-- Not tablosu
CREATE TABLE notlar (
    not_id INT PRIMARY KEY IDENTITY,
    sınav_id INT NOT NULL,
    öğrenci_id INT NOT NULL,
    puan INT NOT NULL,
    FOREIGN KEY (sınav_id) REFERENCES sınav(sınav_id),
    FOREIGN KEY (öğrenci_id) REFERENCES öğrenci(öğrenci_id)
);


-- tablolar bitti



-- ilişkiler başladı

-- Öğrenci - Sınav ilişkisi tablosu (çok-çok)
CREATE TABLE öğrenci_sınav (
    öğrenci_id INT NOT NULL,
    sınav_id INT NOT NULL,
    tarih DATE NOT NULL,
    PRIMARY KEY (öğrenci_id, sınav_id),
    FOREIGN KEY (öğrenci_id) REFERENCES öğrenci(öğrenci_id),
    FOREIGN KEY (sınav_id) REFERENCES sınav(sınav_id)
);

-- Sınıf - Ders ilişkisi tablosu (çok-çok)
CREATE TABLE sınıf_ders (
    sınıf_id INT NOT NULL,
    ders_id INT NOT NULL,
    PRIMARY KEY (sınıf_id, ders_id),
    FOREIGN KEY (sınıf_id) REFERENCES sınıf(sınıf_id),
    FOREIGN KEY (ders_id) REFERENCES ders(ders_id)
);

-- ilişkiler bitti



-- örnek veriler ekleme başladı 

-- Veli tablosu (20 örnek veri)
INSERT INTO veli (ad, soyad, adres, telefon_no) VALUES
('Ali', 'Kaya', 'Ankara', '05011111111'),
('Ayşe', 'Yılmaz', 'Istanbul', '05022222222'),
('Fatma', 'Demir', 'Izmir', '05033333333'),
('Mehmet', 'Çelik', 'Bursa', '05044444444'),
('Ahmet', 'Arslan', 'Antalya', '05055555555'),
('Hasan', 'Güneş', 'Mersin', '05066666666'),
('Zeynep', 'Şahin', 'Adana', '05077777777'),
('Elif', 'Koç', 'Konya', '05088888888'),
('Hüseyin', 'Bulut', 'Gaziantep', '05099999999'),
('Cem', 'Doğan', 'Diyarbakır', '05100000000'),
('Selin', 'Aksoy', 'Eskişehir', '05111111111'),
('Kemal', 'Polat', 'Kayseri', '05122222222'),
('Leyla', 'Özkan', 'Trabzon', '05133333333'),
('Burak', 'Çakır', 'Samsun', '05144444444'),
('Derya', 'Kılıç', 'Manisa', '05155555555'),
('Ebru', 'Şimşek', 'Erzurum', '05166666666'),
('Ferhat', 'Yıldırım', 'Van', '05177777777'),
('Buse', 'Erdoğan', 'Kocaeli', '05188888888'),
('Efe', 'Aydın', 'Aydın', '05199999999'),
('Naz', 'Kurt', 'Malatya', '05200000000');


-- Şube tablosu (5 örnek veri)
INSERT INTO şube (şube_adı) VALUES
('A Şubesi'),
('B Şubesi'),
('C Şubesi'),
('D Şubesi'),
('E Şubesi');

-- Sınıf tablosu (10 örnek veri)
INSERT INTO sınıf (şube_id, sınıf_adı) VALUES
(1, '1-A'),
(1, '2-A'),
(2, '1-B'),
(2, '2-B'),
(3, '1-C'),
(3, '2-C'),
(4, '1-D'),
(4, '2-D'),
(5, '1-E'),
(5, '2-E');

-- Öğretmen tablosu (10 örnek veri)
INSERT INTO öğretmen (ad, soyad, adres, telefon_no, branş) VALUES
('Ahmet', 'Yıldız', 'Ankara', '05311111111', 'Matematik'),
('Ayşe', 'Demir', 'Istanbul', '05322222222', 'Fizik'),
('Fatma', 'Kaya', 'Izmir', '05333333333', 'Kimya'),
('Mehmet', 'Güneş', 'Bursa', '05344444444', 'Biyoloji'),
('Hasan', 'Çelik', 'Antalya', '05355555555', 'Tarih'),
('Zeynep', 'Koç', 'Mersin', '05366666666', 'Coğrafya'),
('Hüseyin', 'Bulut', 'Adana', '05377777777', 'Türkçe'),
('Elif', 'Doğan', 'Konya', '05388888888', 'İngilizce'),
('Cem', 'Arslan', 'Gaziantep', '05399999999', 'Felsefe'),
('Selin', 'Polat', 'Diyarbakır', '05400000000', 'Edebiyat');

-- Ders tablosu (10 örnek veri)
INSERT INTO ders (öğretmen_id, ders_adı, kredi) VALUES
(1, 'Matematik 101', 3),
(2, 'Fizik 101', 4),
(3, 'Kimya 101', 3),
(4, 'Biyoloji 101', 2),
(5, 'Tarih 101', 3),
(6, 'Coğrafya 101', 2),
(7, 'Türkçe 101', 3),
(8, 'İngilizce 101', 3),
(9, 'Felsefe 101', 2),
(10, 'Edebiyat 101', 3);

-- Yönetici tablosu (5 örnek veri)
INSERT INTO yönetici (ad, soyad, adres, telefon_no, görev) VALUES
('Ali', 'Yılmaz', 'Ankara', '05411111111', 'Müdür'),
('Ayşe', 'Kaya', 'Istanbul', '05422222222', 'Müdür Yardımcısı'),
('Fatma', 'Demir', 'Izmir', '05433333333', 'Sekreter'),
('Mehmet', 'Çelik', 'Bursa', '05444444444', 'Muhasebeci'),
('Ahmet', 'Arslan', 'Antalya', '05455555555', 'Teknik Destek');

-- Öğrenci tablosu (20 örnek veri)
INSERT INTO öğrenci (sınıf_id, veli_id, ad, soyad, doğum_tarih, adres, telefon_no, cinsiyet) VALUES
(1, 1, 'Veli', 'Kaya', '2010-05-12', 'Ankara', '05511111111', 'Erkek'),
(2, 2, 'Can', 'Yılmaz', '2011-07-23', 'Istanbul', '05522222222', 'Erkek'),
(3, 3, 'Melis', 'Demir', '2012-08-15', 'Izmir', '05533333333', 'Kız'),
(4, 4, 'Eren', 'Çelik', '2013-10-09', 'Bursa', '05544444444', 'Erkek'),
(5, 5, 'Bora', 'Arslan', '2010-11-17', 'Antalya', '05555555555', 'Erkek'),
(6, 6, 'Cenk', 'Güneş', '2011-03-21', 'Mersin', '05566666666', 'Erkek'),
(7, 7, 'Leyla', 'Şahin', '2010-12-12', 'Adana', '05577777777', 'Kız'),
(8, 8, 'Deniz', 'Koç', '2012-09-14', 'Konya', '05588888888', 'Erkek'),
(9, 9, 'Mert', 'Bulut', '2011-01-10', 'Gaziantep', '05599999999', 'Erkek'),
(10, 10, 'Zehra', 'Doğan', '2010-04-19', 'Diyarbakır', '05600000000', 'Kız'),
(1, 11, 'Ezgi', 'Aksoy', '2011-06-30', 'Eskişehir', '05611111111', 'Kız'),
(2, 12, 'Kerem', 'Polat', '2013-02-15', 'Kayseri', '05622222222', 'Erkek'),
(3, 13, 'Aylin', 'Özkan', '2012-08-25', 'Trabzon', '05633333333', 'Kız'),
(4, 14, 'Barış', 'Çakır', '2011-11-01', 'Samsun', '05644444444', 'Erkek'),
(5, 15, 'Dilan', 'Kılıç', '2010-09-09', 'Manisa', '05655555555', 'Kız'),
(6, 16, 'Esra', 'Şimşek', '2013-03-10', 'Erzurum', '05666666666', 'Kız'),
(7, 17, 'Musa', 'Yıldırım', '2012-07-14', 'Van', '05677777777', 'Erkek'),
(8, 18, 'Irem', 'Erdoğan', '2011-05-20', 'Kocaeli', '05688888888', 'Kız'),
(9, 19, 'Alp', 'Aydın', '2010-12-08', 'Aydın', '05699999999', 'Erkek'),
(10, 20, 'Selin', 'Kurt', '2013-10-29', 'Malatya', '05700000000', 'Kız');

-- Sınav tablosu (10 sınav veri)
INSERT INTO sınav (ders_id, sınav_türü) VALUES
(1, 'Yazılı'),
(2, 'Sözlü'),
(3, 'Quiz'),
(4, 'Yazılı'),
(5, 'Sözlü'),
(6, 'Quiz'),
(7, 'Yazılı'),
(8, 'Sözlü'),
(9, 'Quiz'),
(10, 'Yazılı');

-- Notlar tablosu (20 not veri)
INSERT INTO notlar (sınav_id, öğrenci_id, puan) VALUES
(1, 1, 85),
(2, 2, 90),
(3, 3, 78),
(4, 4, 88),
(5, 5, 92),
(6, 6, 76),
(7, 7, 84),
(8, 8, 89),
(9, 9, 91),
(10, 10, 87),
(1, 11, 80),
(2, 12, 95),
(3, 13, 82),
(4, 14, 77),
(5, 15, 88),
(6, 16, 93),
(7, 17, 79),
(8, 18, 85),
(9, 19, 94),
(10, 20, 86);

-- Öğrenci - Sınav ilişkisi tablosu (20 örnek veri)
INSERT INTO öğrenci_sınav (öğrenci_id, sınav_id, tarih) VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-01-02'),
(3, 3, '2024-01-03'),
(4, 4, '2024-01-04'),
(5, 5, '2024-01-05'),
(6, 6, '2024-01-06'),
(7, 7, '2024-01-07'),
(8, 8, '2024-01-08'),
(9, 9, '2024-01-09'),
(10, 10, '2024-01-10'),
(11, 1, '2024-01-11'),
(12, 2, '2024-01-12'),
(13, 3, '2024-01-13'),
(14, 4, '2024-01-14'),
(15, 5, '2024-01-15'),
(16, 6, '2024-01-16'),
(17, 7, '2024-01-17'),
(18, 8, '2024-01-18'),
(19, 9, '2024-01-19'),
(20, 10, '2024-01-20');

-- Sınıf - Ders ilişkisi tablosu (10 örnek veri)
INSERT INTO sınıf_ders (sınıf_id, ders_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- örnek veriler ekleme bitti



-- saklı yordam oluştutrma başladı 

CREATE PROCEDURE Hesapla_Ogrenci_Notu 
    @DersID INT
AS
BEGIN
    -- Belirli bir dersteki tüm öğrencilerin final notunu hesaplar
    DECLARE @NotToplam INT = 0;
    DECLARE @OgrenciSayisi INT = 0;

    -- Belirtilen dersteki öğrencilerin puanlarını toplar
    SELECT @NotToplam = SUM(puan), @OgrenciSayisi = COUNT(*) 
    FROM notlar
    INNER JOIN sınav ON notlar.sınav_id = sınav.sınav_id
    WHERE sınav.ders_id = @DersID;

    -- Eğer derste öğrenci varsa, ortalama hesaplanır
    IF @OgrenciSayisi > 0
    BEGIN
        PRINT 'Dersin ortalaması: ' + CAST(@NotToplam / @OgrenciSayisi AS VARCHAR(10));
    END
    ELSE
    BEGIN
        PRINT 'Bu derste hiç öğrenci yok!';
    END
END;

-- saklı yordam oluştutrma bitti


-- trigger oluştutrma başladı 

CREATE TRIGGER NotAltiElliTrigger
ON notlar
AFTER INSERT
AS
BEGIN
   -- öğrencinin notu 50'den düşükse kaydını güncelle
    DECLARE @OgrenciID INT;
    DECLARE @Puan INT;

    SELECT @OgrenciID = öğrenci_id, @Puan = puan FROM inserted;

    IF @Puan < 50
    BEGIN
        UPDATE öğrenci
        SET adres = 'Bu öğrenci başarısız'
        WHERE öğrenci_id = @OgrenciID;
    END
END;

-- trigger oluştutrma başladı bitti


-- Transaction Management oluşturma başladı 

BEGIN TRANSACTION;

BEGIN TRY
    -- Öğrenci tablosuna yeni öğrenci ekleniyor
    INSERT INTO öğrenci (sınıf_id, veli_id, ad, soyad, doğum_tarih, adres, telefon_no, cinsiyet)
    VALUES (1, 1, 'Mehmet', 'Öztürk', '2014-05-15', 'Istanbul', '05712345678', 'Erkek');

    -- Yeni öğrenci için notlar tablosuna puan ekleniyor
    DECLARE @OgrenciID INT = SCOPE_IDENTITY();  -- Yeni öğrencinin ID'si alınıyor
    INSERT INTO notlar (sınav_id, öğrenci_id, puan)
    VALUES (1, @OgrenciID, 85);

    -- Eğer burada hata olmazsa, işlem onaylanır
    COMMIT;
END TRY

BEGIN CATCH
    -- Bir hata oluşursa, yapılan değişiklikler geri alınır
    ROLLBACK;

    -- Hata mesajı gösterilir
    PRINT 'Bir hata oluştu: ' + ERROR_MESSAGE();
END CATCH;

-- Transaction Management oluşturma bitti