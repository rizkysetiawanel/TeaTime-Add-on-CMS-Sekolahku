# TEA TIME ADD ON UNTUK CMS SEKOLAHKU

version : 0.1

kostumasi sistem untuk cms sekolahku ini hanya untuk versi 2.1.3 free version jangan coba untuk yang premium.
kare ane bukan guru/kepala sekolah/atau yang berhubungan dengan instansi sekolah jadi ane gak bisa untuk make yang premium.
add on ini atau kostumasi sistem untuk develop mungkin gak akan selalu update tapi insya Allah ane akan coba terus update jika
ada versi yang terbaru dari cms nya dan juga mencoba bikin fungsi - fungsi baru lagi. 

# FUNGSI
* Mengatur jumlah pemunculan posting pada halaman arsip / tag / kategori


# INSTALASI

* Paste kan file **Teatime_helper** ke folder **root_folder_website_anda/appliction/helper**
  lalu buka file **autoload.php** di **root_folder_website_anda/appliction/config/** lalu tambahkan pada **$autoload['helper']**
  dengan **Teatime_helper**
  code nya kira - kira akan seperti ini
  ```php
  $autoload['helper'] = array('url', 'html',  'antonsofyan', 'datasource', 'teatime_helper');
  ```
* Pada database insert data pada table **settings** dengan data berikut
  * group        = reading
  * variable     = post_per_tag_cat
  * default      = 6
  * group_access = public, student, employee, administrator, super_user
  * description  = bebas kalo ane **Jumlah post per halaman (arc/tag/kategori)**
  * updated_by   = masukan id admin kalo ane **1**
  untuk field berhubungan dengan tanggal diisi bebas

# BACA Dokumentasi

Ane sarankan untuk baca dokumentasi pada folder dokumentasi disitu ditulis cara menerapkan fungsi - fungsi nya, jadi ane gak bakal,
ngejelasin penerapan semua fungsi pada Readme ini.

# Contact 
WA: 081311243588 (sertakan nama nya)
FB: https://www.facebook.com/mychemicalromance.rizky
