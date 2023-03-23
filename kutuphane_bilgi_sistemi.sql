-- SQL ifadelerinizi buraya yazınız.
CREATE TABLE `kitap`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `sayfasayisi` INT NOT NULL,
    `puan` INT NOT NULL,
    `yazar_id` INT UNSIGNED  NOT NULL,
    `tur_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`) 
);

CREATE TABLE `islem`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_id` INT UNSIGNED NOT NULL,
    `kitap_id` INT UNSIGNED NOT NULL,
    `atarih` TEXT NOT NULL,
    `vtarih` TEXT NOT NULL,
    PRIMARY KEY (`id`) 
);
ALTER TABLE `islem` MODIFY COLUMN `vtarih` DATETIME NOT NULL;
ALTER TABLE `islem` MODIFY COLUMN `kitap_id` BIGINT NOT NULL;


CREATE TABLE `ogrenci`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    `dtarih` TEXT NOT NULL,
    `cinsiyet` TEXT NOT NULL,
    `sinif` TEXT NOT NULL,
    `puan` TEXT NOT NULL,
    PRIMARY KEY (`id`) 
);

CREATE TABLE `tur`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` BIGINT NOT NULL,
    PRIMARY KEY (`id`) 
);

CREATE TABLE `yazar`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    PRIMARY KEY (`id`) 
);

ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`id`);

----------------------------------
--CEVAPLAR
--1

ALTER TABLE `ogrenci`
ADD COLUMN `sehir` TEXT NOT NULL;

--2
--`islem` tablosundaki `atarih` sütunu için veri tipini değiştirme
ALTER TABLE `islem` MODIFY COLUMN `atarih` DATETİME NOT NULL;

-- `islem` tablosundaki `vtarih` sütunu için veri tipini değiştirme
ALTER TABLE `islem` MODIFY COLUMN `vtarih` DATETİME NOT NULL;

-- `ogrenci` tablosundaki `dtarih` sütunu için veri tipini değiştirme
ALTER TABLE `islem` MODIFY COLUMN `dtarih` DATETİME NOT NULL;

--3
ALTER TABLE `ogrenci` ADD COLUMN `dogum_yeri` TEXT NOT NULL DEFAULT "Türkiye";

--4
ALTER TABLE `ogrenci` DROP COLUMN `puan`;

--5
CREATE TABLE `kiz_ogrenciler` AS (
    SELECT * FROM ogrenci where cinsiyet="K"
);

--6
DROP TABLE `kiz_ogrenciler`;

--7
CREATE TABLE `kiz_yurdu` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `kiz_yurdu` (`ad`) VALUES("Örnek Kız Yurdu");
CREATE TABLE `kiz_yurdunda_kalanlar` AS SELECT `ogrenci`.* FROM `ogrenci` JOIN `kiz_yurdu` ON 1=1 WHERE `ogrenci`.`cinsiyet` = "K";

--8
ALTER TABLE `kiz_ogrenciler` RENAME TO `kogrenciler`;

--9
ALTER TABLE yazar
CHANGE COLUMN `ad` `name` VARCHAR(255);

--10
ALTER TABLE `yazar` ADD COLUMN `ulke` TEXT DEFAULT 'Türkiye';
ALTER TABLE `yazar` ADD COLUMN `universite` TEXT;

--11
1-1 ilişki örnekleri:

Bir kişiye sadece bir pasaport verilebilir. Pasaportlar da sadece bir kişiye ait olabilir. Bu durumda kişi ve pasaport tabloları arasında 1-1 ilişki vardır.
Bir müşterinin sadece bir hesabı olabilir, hesaplar da sadece bir müşteriye ait olabilir. Bu durumda müşteri ve hesap tabloları arasında 1-1 ilişki vardır.

1-n ilişki örnekleri:

Bir üniversitede birçok fakülte olabilir ancak bir fakülte sadece bir üniversiteye ait olabilir. Bu durumda üniversite ve fakülte tabloları arasında 1-n ilişki vardır.
Bir şirkette birçok çalışan olabilir ancak bir çalışan sadece bir departmana ait olabilir. Bu durumda çalışan ve departman tabloları arasında 1-n ilişki vardır.

n-n ilişki örnekleri:

Bir restoranda birçok müşteri olabilir ve bir müşteri de birçok restoranda yemek yiyebilir. Bu durumda müşteri ve restoran tabloları arasında n-n ilişki vardır.
Bir öğrenci birçok ders alabilir ve bir derse de birçok öğrenci kaydolabilir. Bu durumda öğrenci ve ders tabloları arasında n-n ilişki vardır.








