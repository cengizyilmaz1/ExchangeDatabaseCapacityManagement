# ExchangeDatabaseCapacityManagement
Bu repository, Exchange Server'da veritabanlarına posta kutusu dağılımını otomatikleştirmek için bir PowerShell script'i içerir.

Genel Bakış
Bu PowerShell script'i, belirli bir veritabanındaki tüm posta kutularını alır, bunların boyutlarını hesaplar ve veritabanlarına eşit bir şekilde dağıtır. Her veritabanının maksimum boyutu 200GB'dir ve her posta kutusunun maksimum boyutu 40GB olarak belirlenmiştir. Posta kutusu boyutu 40GB'ı geçtiğinde veya toplam veritabanı boyutu 200GB'ı aştığında, script otomatik olarak yeni bir veritabanı oluşturur ve sonraki posta kutularını bu yeni veritabanına yerleştirir.

Kullanım
PowerShell'i yönetici olarak çalıştırın.
Script'i çalıştırın ve istendiğinde veritabanı adını girin.
powershell
Copy code
.\mailbox-distribution.ps1
Script çalıştığında, belirttiğiniz veritabanında bulunan tüm posta kutularını alır, bunların boyutlarını hesaplar ve bir CSV dosyasına posta kutusu kullanıcısının UPN'sini, posta kutusu boyutunu ve hedef veritabanının adını içerir bir şekilde kaydeder.
Özelleştirme
Bu script'i kendi ihtiyaçlarınıza göre özelleştirebilirsiniz. Özellikle, $maxDbSizeGB ve $maxMailboxSizeGB değişkenlerini, maksimum veritabanı ve posta kutusu boyutlarınıza uyacak şekilde ayarlayabilirsiniz.

Lisans
Bu proje MIT Lisansı ile lisanslanmıştır - daha fazla detay için LICENSE dosyasına bakın.

Katkı
Pull request'ler ve yararlı özellik önerileri bekliyoruz!

Not: Bu README, dil çevirileri veya başka detaylar konusunda yardımcı olabilecek her türlü geri bildirimi kabul ediyoruz. Her türlü katkıyı takdir ederiz!
