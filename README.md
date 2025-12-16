🎮 GameVault Database Project
📌 Proje Tanımı

Bu proje, Steam veya Epic Games benzeri bir dijital oyun dağıtım platformu için tasarlanmış ilişkisel bir veritabanı sistemini içermektedir.
Veritabanı; oyun geliştirici firmalar, oyunlar ve oyun türleri arasındaki ilişkileri yönetmek amacıyla oluşturulmuştur.

Proje kapsamında DDL, DML, UPDATE, DELETE ve JOIN işlemleri uygulanmış, 1–N ve N–N ilişkiler başarıyla modellenmiştir.

🗂️ Veritabanı Yapısı

Veritabanı 4 ana tablodan oluşmaktadır:

1️⃣ developers (Geliştirici Firmalar)

Oyunları geliştiren firmaların bilgilerini tutar.

Bir geliştirici birden fazla oyun üretebilir (One-to-Many).

2️⃣ games (Oyunlar)

Oyunlara ait temel bilgileri içerir.

Her oyun bir geliştiriciye bağlıdır.

3️⃣ genres (Türler)

Oyun türlerini ve kısa açıklamalarını barındırır.

4️⃣ games_genres (Ara Tablo)

Oyunlar ile türler arasındaki Many-to-Many ilişkiyi sağlar.

Bir oyun birden fazla türe sahip olabilir.

🔗 İlişkiler

developers → games : One-to-Many

games ↔ genres : Many-to-Many (games_genres tablosu üzerinden)

Bu yapı sayesinde veriler tekrar edilmeden, normalize bir şekilde tutulmaktadır.

🧪 Gerçekleştirilen İşlemler
📌 DDL (CREATE)

Tüm tablolar PRIMARY KEY ve FOREIGN KEY kısıtları ile oluşturulmuştur.

Silme işlemlerinde veri bütünlüğü için ON DELETE CASCADE kullanılmıştır.

📌 DML (INSERT)

5 geliştirici firma

5 oyun türü

10 oyun

Oyun–Tür eşleştirmeleri eklenmiştir.

📌 UPDATE / DELETE

Tüm oyunlara %10 indirim uygulanmıştır.

Bir oyunun puanı güncellenmiştir.

Bir oyun, ilişkili kayıtlarıyla birlikte güvenli şekilde silinmiştir.

📌 SELECT & JOIN (Raporlama)

Oyun + geliştirici bilgileri listelenmiştir.

RPG türündeki oyunlar filtrelenmiştir.

500 TL üzerindeki oyunlar fiyat analizine tabi tutulmuştur.

İsim içinde belirli kelime geçen oyunlar aranmıştır.

🛠️ Kullanılan Teknolojiler

SQL (PostgreSQL / MySQL uyumlu)

DrawSQL (ER Diyagramı için)
