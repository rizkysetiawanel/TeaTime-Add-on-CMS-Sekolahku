# TEA TIME HELPER UNTUK CMS SEKOLAHKU

version : 0.1

helper ini masih tahap perkembangan, dan akan di update untuk menyesuaikan dengan fitur cms sekolahku yang baru.

kostumasi yang di tambahkan di helper ini:

1. mengatur jumlah post per tag / kategori

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

# Contact 
WA: 081311243588 (sertakan nama nya)
FB: https://www.facebook.com/mychemicalromance.rizky
