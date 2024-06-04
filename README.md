<a>
Khusus Android.<br/>
Gunakan Mt manager yang support terminal dan atau gunakan Termux.<br/>
Mt manager dan Termux harus terpasang busybox.<br/>
Skrip ini untuk membuat garis baru pada subtitle secara otomatis.<br/>
Alih-alih daripada Anda membuat garis baru secara manual dengan jari tangan Anda sendiri yang memakan waktu lama.<br/>
Skrip ini akan membagi jumlah kata dalam satu baris hanya di atas 3 kata. (karena subrip hanya memiliki minimal 1-3 kata, 00:00:00,001 --> 00:00:03,050), menjadi 2 bagian,<br/>Ini seperti melipat isi teks.<br/>
Contoh misalnya dalam subrip ada satu baris berisi 5 atau lebih kata:<br/><pre>
1
00:00:00,001 --> 00:00:03,050
Ini adalah skrip buatan jendraljack<br/>
2
00:00:03,050 --> 00:00:05,100
baris subrip ini adalah baris kedua dari baris pertama.
<br/>
</pre>
skrip akan merubah isi text jadi begini:<br/>
<pre>
1
00:00:00,001 --> 00:00:03,050
Ini adalah
skrip buatan jendraljack.<br/>
2
00:00:03,050 --> 00:00:05,100
baris subrip ini adalah
baris kedua dari baris pertama<br/></pre>

skrip akan membagi 2 semua kata,<br/>Misalnya 4 kata, menjadi diatas 2 kata dan 2 kata dibawah dst<br/>
jika Anda mendapat berkas subrip.srt dari unduhan.<br/>
Mungkin ada 2 dialog.<br/>
- dialog pertama
- dialog kedua.
ubah jadi.<br/>
dialog pertama./ dialog kedua.<br/>
Dan kamu perlu membuang semua garis baru.<br/>
di android gunakan aplikasi "easy subtitle".
ubah garis baru jadi "#".<br/>
lalu di aplikasi text editor biasa(bisa di MT manager), replace # jadi spasi.<br/>
dan ubah atau hilangkan symbol tanda petik 2 " dan simbol dolar $, terserah anda mengganti dengan karakter apa, asal jangan ada petik 2.<br/>
Baru kamu bisa gunakan skrip newline maker ini. Dengan perintah di terminal.<br/><br/>
update - gunakan versi 2<br/>
versi lama terlalu banyak makan memori.<br/><br/>
<pre>sh ./build.txt.sh /path/subrip.srt</pre>
</a> 
