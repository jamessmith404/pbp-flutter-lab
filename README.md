# Tugas 7: Elemen Dasar Flutter

### Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_ dan jelaskan perbedaan dari keduanya.

_Stateless widget_ merupakan _widget_ yang tidak memiliki _state_ tertentu setelah dibuat. Jadi setelah _widget_ tersebut dibuat, keadaan apapun yang ada di dalam _state_ tersebut tidak dapat diubah (_immutable_). _Stateless widget_ me-_override_ `build()` method dan mengembalikan _widget_. Jenis ini digunakan ketika UI-nya bergantung kepada informasi dari objek itu sendiri.

_Stateful widget_ merupakan _widget_ yang memiliki _state_ tertentu dan dapat diubah berkali-kali selama _widget_-nya masih ada, seperti variabel, input, dan datanya. Jenis ini digunakan ketika UI nya didesain untuk dapat berubah secara dinamis. _Stateful widget_ meng-_override_ `createState()` dan me-_return_ `State`.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `Scaffold`, merupakan _widget_ yang menyediakan struktur _layout_ sederhana yang nantinya akan menampung banyak _widget_.
2. `AppBar`, merupakan _widget_ yang terletak pada posisi bagian atas aplikasi (yang ada tulisan _Program Counter_), mirip _Navbar_ yang ada di Website.
3. `Center`, merupakan _widget_ yang mengatur posisi _child_-nya ke posisi tengah layar
4. `Column`, merupakan _widget_ yang menampilkan _child_-nya di dalam bentuk array vertikal.
5. `Padding`, merupakan _widget_ yang mengatur jarak bagian dalam (_insets_) dari _child widget_-nya
6. `Text`, merupakan _widget_ yang menampilkan tulisan teks dalam satu _style_ tertentu.
7. `Stack`, merupakan _widget_ yang mengatur posisi dari _child_-nya secara relatif ke pinggiran dari box.
8. `Align`, merupakan _widget_ yang mengatur posisi dari _child_-nya dengan menambahkan _constraint_ `alignment` untuk meletakkan childnya di dalam box _widget_ tersebut.

### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` berguna untuk memberi informasi kepada _framework_ bahwa _internal state_ dari sebuah objek telah diubah.

### Jelaskan perbedaan antara `const` dengan `final`.
Meski sama-sama bersifat konstan/tidak dapat berubah, mereka memiliki perbedaan. `const` membuat isi variabel tersebut konstan ketika waktu _compile_, sedangkan `final` isi variabelnya tersedia pada saat waktu _run_. 

### Implementasi _Checklist_
1. Membuat aplikasi `counter_7` dengan menjalankan perintah
`flutter run counter_7`. Jalankan melalui VSCode dan Android Studio untuk membuka emulator mobile.
2. Membuat fungsi `_decrementCounter` yang ada di class `_MyHomePageState` mirip seperti `_incrementCounter`, cuma di-decrement. Kalau `_counter` sudah 0, jangan dikurangi lagi (agar tidak negatif)
```dart
void _decrementCounter() {
    setState(() {
      if (_counter > 0) { // Agar tidak minus
        _counter--;
      }
    });
  }
```
3. Menambahkan tombol decrement `FloatingActionButton` yang akan memanggil fungsi `_decrementCounter` ketika diklik menggunakan widget `Align` agar nanti bisa diarahkan posisinya. Untuk `Icon`-nya diganti dengan remove.
```dart
Align(
    alignment: Alignment.bottomLeft,
    child: FloatingActionButton(
    onPressed: _decrementCounter,
    tooltip: 'Decrement',
    child: const Icon(Icons.remove),
    ),
),
```
4. Tambahkan _conditional_ untuk menampilkan teks yang akan dimunculkan sesuai dengan ganjil-genapnya angka. Hal ini dilakukan di child widget `Column`.
```dart
child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    if (_counter % 2 == 0)
        const Text(
        'GENAP',
        style: TextStyle(color: Colors.red),
        )
    else 
        const Text(
        'GANJIL',
        style: TextStyle(color: Colors.blue),
        ),
    
    Text(
        '$_counter',
        style: Theme.of(context).textTheme.headline4,
    ),
    ],
),
```
5. Tambahkan juga _style_ seperti warna teks seperti yang diminta pada soal. Merah untuk teks "GENAP" dan biru untuk teks "BIRU" dengan widget `TextStyle`

6. Mengatur tampilan layout dengan menggunakan widget `Padding` serta mengatur _widget_ tersebut di tengah layar. Atur posisi button _increment_ di kanan bawah dan _decrement_ di kiri bawah dengan menggunakan widget `Alignment`.

7. Tambahkan logika (untuk bonus) agar menampilkan tombol _decrement_ ketika value dari `_counter` > 0. Jika tidak memenuhi, jangan dibuat widget dari button tersebut.

8. Edit nama aplikasi di widget `MyApp` dengan mengganti atribut `title` widget `MaterialApp` dengan `Flutter Demo`

9. Membuat repository ini dengan nama `flutter-pbp-lab`, kemudian lakukan `git init` dan `git remote` ke HTTPS repo ini. Kemudian lakukan `add-commit-push`.

# Tugas 8: Flutter Form

### Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` dan `Navigator.pushReplacement` sama-sama menambahkan _route_ ke Navigator. Yang menjadi pembeda adalah `Navigator.push` _route_ yang ada di bawahnya akan tetap tersimpan di dalam `Stack`, sedangkan `Navigator.pushReplacement` akan membuang _route_ yang sebelumnya ditimpa.

### Widget-widget yang dipakai
1. `Form` : untuk menghimpun elemen-elemen pada halaman input budget.
2. `Drawer` : sebagai bagian untuk navigasi antar halaman layaknya `Navbar` di Django, terdapat di bagian atas aplikasi (bisa di bawah, kiri, atau kanan juga tergantung pemosisiannya).
3. `TextFormField`  : untuk menampilkan _textbox_ untuk menginput judul dan nominal budget.
4. `DropdownButtonFormField`  : untuk menampilkan menu dropdown berisi tipe budget.
5. `InputDecoration`  : untuk mengkustomisasi tampilan dari `TextFormField`, seperti menambahkan teks bantuan, label, ikon, serta border.
6. `TextButton` : untuk menambahkan tombol submisi budget
7. `Card` : untuk menampilkan informasi mengenai suatu budget dalam bentuk kotak kartu.

### Jenis-jenis _event_ pada Flutter
1. `onPressed`
2. `onTap`
3. `onSaved`
4. `onChange`
5. `onEnter`
6. `onExit`
7. `onHover`

### Cara kerja `Navigator`
`Navigator` bekerja sebagai manager untuk setiap _child_ yang ada layaknya Stack. Tujuannya adalah sebagai urutan logika dalam menampilkan halaman pada aplikasi. Yang disimpan pada `Navigator` adalah _routes_ pada app. Untuk berpindah dari satu halaman ke halaman lain, terdapat method `push` dan `pop`. `push` adalah untuk menambahkan _route_ baru pada Navigator serta pindah ke _route_ tersebut sedangkan `pop` adalah untuk melepas _route_ yang ada di paling atas Navigator dan kembali ke _route_ sebelumnya.

### Implementasi Checklist
1. Membuat model untuk budget dengan membuat file `models.dart`. Di sana saya membuat class baru bernama `Budget` yang berisi atribut dasar pada budget serta `BudgetModel` yang me-_extends_ `ChangeNotifier` untuk me-manage state dari `Budget` ketika akan ada penambahan pada data List.
2. Membuat halaman penambahan form dengan membuat file `add.dart`. Di sana saya membuat class `AddBudget` untuk nanti dipanggil di `Drawer` serta `_AddBudgetState` untuk mengatur bagaimana ketika widget `AddBudget` ini dibuat. Saya menambahkan `Form` serta elemen-elemen yang dibutuhkan dalam pembuatan form seperti textbox, dropdown menu, dan button.
3. Membuat halaman penampilan form di file `list.dart`. Di sana saya membuat class `BudgetList` untuk nanti dipanggil di `Drawer` serta `_BudgetListState` mengatur bagaimana ketika widget `BudgetList` ini dibuat. Saya menambahkan `ListView` untuk menampilkan setiap elemen pada List berisi data budget. Setiap elemen akan ditampilkan dalam widget `Card`.
4. Membuat bar untuk navigasi antar halaman di file `drawer.dart`. Di sana saya membuat class `LabDrawer` serta `_LabDrawerState` untuk mengatur bagaimana ketika widget `LabDrawer` dibuat. Saya membuat `Drawer` yang berisi `ListTile` berisi nama-nama _route_ untuk berpindah-pindah halaman serta menambahkan event listener `onTap` untuk berpindah halaman.

# Tugas 9: Integrasi Web Service pada Flutter
### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu?
Tentu saja kita bisa mengambil data JSON tanpa perlu membuat model terlebih dahulu. Akan tetapi, hal tersebut bukanlah _best practice_. Hal tersebut akan membuat penyimpanan data yang di-_fetch_ akan berantakan. Dengan pembuatan model, data JSON yang di-_fetch_ dan disimpan menjadi lebih rapi, bersih, dan terstruktur sehingga mudah untuk diolah.

### Widget-widget yang digunakan
1. `FutureBuilder`: sebagai widget yang dapat membangun dirinya sendiri sesuai dengan status yang pada future sebagai wujud komputasi asinkronus
2. `LabDrawer` : sebagai bagian untuk navigasi antar halaman layaknya `Navbar` di Django, terdapat di bagian atas aplikasi (bisa di bawah, kiri, atau kanan juga tergantung pemosisiannya). Merupakan kustomisasi Drawer buatan sendiri.
3. `ListView` : dengan method `builder()` untuk membuat _cards_ pada layar sesuai dengan banyak data yang di-_fetch_ sebelumnya.
4. `DateFormat`: untuk me-format data tanggal agar ditampilkan dengan standar penulisan tanggal (saya menggunakan sistem penanggalan US).
5. `InputDecoration`  : untuk mengkustomisasi tampilan dari `TextFormField`, seperti menambahkan teks bantuan, label, ikon, serta border.
6. `ElevatedButton`: untuk menampilkan button untuk kembali ke page my watch list setelah masuk ke bagian detail.
7. beberapa Widget lainnya dari lab dan tugas sebelumnya.

### Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
1. Diberikan alamat URI dari API endpoint untuk di-_parse_ agar dapat di-_fetch_.
2. Data akan di-_fetch_ dari API endpoint dari Heroku (Lab 3)
3. Data yang telah di-_fetch_ akan di-_decode_ menjadi JSON dengan format UTF-8.
4. Dari model yang telah dibuat sebelumnya, data JSON akan diubah menjadi data dalam bentuk model agar mudah untuk diolah.
5. Data yang sudah didapat akan ditampilkan secara langsung atau melewati beberapa operasi logika di aplikasi Flutter.

### Implementasi Checklist Tugas 9
1. Menambahkan _dependency_ `http` ke dalam projek Tugas Flutter ini.
2. Membuat model `MyWatchlist` sesuai dengan respons dari data yang diambil, yaitu atribut/fields yang sesuai dengan model yang dibuat pada Tugas 3.
3. Membuat halaman `my_watchlist_page` untuk menampilkan setiap identitas film yang di-_fetch_ sebelumnya. Data-datanya akan ditampilkan dalam bentuk tumpukan _cards_ yang dapat di-_scroll_ dan dapat ditekan untuk mengakses halaman detail yaitu `my_watchlist_detail`. Kemudian mengaturan tampilan dan route nya.
4. Membuat halaman `my_watchlist_detail` yang menampilkan setiap detail dari objek `MyWatchlist` yaitu setiap atribut yang dimilikinya. Dapat diakses dengan menekan salah satu _card_ pada halaman `my_watchlist_page`. Kemudian mengatur tampilan dan route nya.
5. Membuat button `back` dengan menggunakan `ElevatedButton` di halaman `my_watchlist_detail` agar pengguna dapat kembali ke halaman sebelumnya.
6. Melakukan _refactoring files_ yang ada sebelumnya dari Tugas 6 dan 7.