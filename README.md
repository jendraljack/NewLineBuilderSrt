<a>
Khusus Android.<br/>
Gunakan Mt manager yang support terminal dan atau gunakan Termux.<br/>
Mt manager dan Termux harus terpasang busybox.<br/>
Skrip ini untuk membuat baris baru pada subtitle secara otomatis.<br/>
Alih-alih daripada Anda membuat baris baru secara manual dengan jari tangan Anda sendiri yang memakan waktu lama.<br/>
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

skrip akan membagi 2 semua kata,<br/>Misalnya 4 kata, menjadi baris diatas 2 kata dan baris-baru dibawah 2 kata, dst<br/>
jika Anda mendapat berkas subrip.srt dari unduhan.<br/>
Mungkin ada 2 dialog sperti.<br/>
<pre>1
00:00:10,899 --> 00:00:15,780
- dialog pertama
- dialog kedua.

</pre>
ubah jadi.<br/>
<pre>1
00:00:10,899 --> 00:00:15,780
dialog pertama./ dialog kedua.

</pre>
Dan kamu perlu membuang semua baris baru menjadi spasi dulu.<br/>
di android gunakan aplikasi "easy subtitle".
ubah garis baru jadi "#".<br/>
lalu di aplikasi text editor biasa(bisa di MT manager), replace # jadi spasi.<br/>
dan ubah atau hilangkan symbol tanda petik 2 " dan simbol dolar "$", terserah anda mengganti dengan karakter apa, asal jangan ada simbol petik 2 dan simbol "$".<br/>
Baru kamu bisa gunakan skrip newline maker ini. Dengan perintah di terminal.<br/><br/>
update - gunakan versi 2<br/>
versi lama terlalu banyak makan memori.<br/><br/>
<pre>sh ./build.txt.sh /path/subrip.srt</pre>
</a> 
