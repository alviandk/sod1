uses crt;
const
garis='--------------------------------------------------';

type
          nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string[10] ;
          kelas   : string[5]
    end;

var
   file_nilai           : file of nilai;
   nilai_mhs            : nilai;
   i,j,jm1,jm2,gran       : integer;


begin

     assign(file_nilai,'D:\mahasi.dat');
     reset(file_nilai);
     clrscr;
     writeln;
     writeln(' ':35,'Halaman 1');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 1 to 4 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',j:2,'|',npm:9,'|  ',nama:12,'| ',kelas:6,'|',tgl_lhr:10,'  |');

          end;
		writeln;
          
		  
     end;
	 writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');
	 readln;
	 clrscr;
     writeln;
     writeln(' ':35,'Halaman 2');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 5 to 8 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',j-4:2,'|',npm:9,'|  ',nama:12,'| ',kelas:6,'|',tgl_lhr:10,'  |');

          end;

          writeln;
     end;
     writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');
	 readln;
	 clrscr;
     writeln;
     writeln(' ':35,'Halaman 3');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 9 to 12 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',j-8:2,'|',npm:9,'|  ',nama:12,'| ',kelas:6,'|',tgl_lhr:10,'  |');

          end;

          writeln;
     end;
     writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');
	 readln;
	 clrscr;
     writeln;
     writeln(' ':35,'Halaman 4');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 13 to 16 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',j-12:2,'|',npm:9,'|  ',nama:12,'| ',kelas:6,'|',tgl_lhr:10,'  |');

          end;

          writeln;
     end;
     writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');
	 readln;
	 
	 clrscr;
     writeln;
     writeln(' ':35,'Halaman 5');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 17 to 20 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',j-16:2,'|',npm:9,'|  ',nama:12,'| ',kelas:6,'|',tgl_lhr:10,'  |');

          end;

          writeln;
     end;
     writeln(garis);
	 writeln('Tekan Enter untuk keluar!!');
	 readln;
	 
	 close(file_nilai);
     readln;
   end.
