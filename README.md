<a>
Khusus Android.<br/>
Gunakan Mt manager yang support terminal dan atau gunakan Termux.<br/>
Mt manager dan Termux harus terpasang busybox.<br/>
Skrip ini untuk membuat garis baru pada subtitle secara otomatis.<br/>
alih-alih daripada Anda membuat garis baru secara manual dengan jari tangan Anda sendiri yang memakan waktu lama.<br/>
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
jika Anda mendapat berkas subrip.srt dari unduhan.
kamu perlu membuang semua garis baru.<br/>
di android gunakan aplikasi "easy subtitle"
ubah garis baru jadi "#".<br/>
di text editor biasa, replace # jadi spasi.<br/>
dan hilangkan tanda kutip '"', terserah anda mengganti dengan karakter apa, asal jangan ada tanda kutip.<br/>
Baru kamu bisa gunakan skrip newline maker ini. Dengan perintah di terminal.<br/><br/>
<pre>sh main-CreateNLSubrip.sh /path/subrip.srt</pre>
</a> 
