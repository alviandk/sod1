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
   file_nilai,FileTmp           : file of nilai;
   nilai_mhs,tmp            : nilai;
   i,j,jm1,jm2,gran       : integer;


begin

     assign(file_nilai,'D:\mahsi.dat');
     reset(file_nilai);
	 Assign(filetmp,'D:\tmpu.dat');
	Rewrite(FileTmp);

     clrscr;
     writeln;
     writeln(' ':35,'Halaman 1');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 1 to filesize(file_nilai) do
     begin
          seek(file_nilai,j-1);
	  read(file_nilai,nilai_mhs);
          if nilai_mhs.nama <'F' then
			write(filetmp,nilai_mhs);
     end;
		  for i:= 1 to filesize(filetmp) do
		  begin
		  seek(filetmp,i-1);
		  read(filetmp,nilai_mhs);

          write('|',i:2,'|',nilai_mhs.npm:9,'|  ',nilai_mhs.nama:12,'| ',nilai_mhs.kelas:6,'|',nilai_mhs.tgl_lhr:10,'  |');

        writeln;
		end;



	 writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');

	 close(file_nilai);
	 close(filetmp);
     readln;
	 
	 clrscr;
	 assign(file_nilai,'D:\mahsi.dat');
     reset(file_nilai);
	 Assign(filetmp,'D:\tmpu.dat');
	Rewrite(FileTmp);

     clrscr;
     writeln;
     writeln(' ':35,'Halaman 2');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 1 to filesize(file_nilai) do
     begin
          seek(file_nilai,j-1);
	  read(file_nilai,nilai_mhs);
          if (nilai_mhs.nama >'E') and (nilai_mhs.nama <'K')  then
			write(filetmp,nilai_mhs);
     end;
		  for i:= 1 to filesize(filetmp) do
		  begin
		  seek(filetmp,i-1);
		  read(filetmp,nilai_mhs);

          write('|',i:2,'|',nilai_mhs.npm:9,'|  ',nilai_mhs.nama:12,'| ',nilai_mhs.kelas:6,'|',nilai_mhs.tgl_lhr:10,'  |');

        writeln;
		end;



	 writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');

	 close(file_nilai);
	 close(filetmp);
     readln;
	 
	 clrscr;
	 assign(file_nilai,'D:\mahsi.dat');
     reset(file_nilai);
	 Assign(filetmp,'D:\tmpu.dat');
	Rewrite(FileTmp);

     clrscr;
     writeln;
     writeln(' ':35,'Halaman 3');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 1 to filesize(file_nilai) do
     begin
          seek(file_nilai,j-1);
	  read(file_nilai,nilai_mhs);
          if (nilai_mhs.nama >'J') and (nilai_mhs.nama <'P')  then
			write(filetmp,nilai_mhs);
     end;
		  for i:= 1 to filesize(filetmp) do
		  begin
		  seek(filetmp,i-1);
		  read(filetmp,nilai_mhs);

          write('|',i:2,'|',nilai_mhs.npm:9,'|  ',nilai_mhs.nama:12,'| ',nilai_mhs.kelas:6,'|',nilai_mhs.tgl_lhr:10,'  |');

        writeln;
		end;



	 writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');

	 close(file_nilai);
	 close(filetmp);
     readln;
	 
	 clrscr;
	 assign(file_nilai,'D:\mahsi.dat');
     reset(file_nilai);
	 Assign(filetmp,'D:\tmpu.dat');
	Rewrite(FileTmp);

     clrscr;
     writeln;
     writeln(' ':35,'Halaman 4');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 1 to filesize(file_nilai) do
     begin
          seek(file_nilai,j-1);
	  read(file_nilai,nilai_mhs);
          if (nilai_mhs.nama >'O') and (nilai_mhs.nama <'U')  then
			write(filetmp,nilai_mhs);
     end;
		  for i:= 1 to filesize(filetmp) do
		  begin
		  seek(filetmp,i-1);
		  read(filetmp,nilai_mhs);

          write('|',i:2,'|',nilai_mhs.npm:9,'|  ',nilai_mhs.nama:12,'| ',nilai_mhs.kelas:6,'|',nilai_mhs.tgl_lhr:10,'  |');

        writeln;
		end;



	 writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');

	 close(file_nilai);
	 close(filetmp);
     readln;
	 
	 clrscr;
	 assign(file_nilai,'D:\mahsi.dat');
     reset(file_nilai);
	 Assign(filetmp,'D:\tmpu.dat');
	Rewrite(FileTmp);

     clrscr;
     writeln;
     writeln(' ':35,'Halaman 2');
     writeln(garis);
     writeln('|No|   NPM   |     Nama     | Kelas |  Tgl Lahir |');
     writeln(garis);
     for j:= 1 to filesize(file_nilai) do
     begin
          seek(file_nilai,j-1);
	  read(file_nilai,nilai_mhs);
          if (nilai_mhs.nama >'T')  then
			write(filetmp,nilai_mhs);
     end;
		  for i:= 1 to filesize(filetmp) do
		  begin
		  seek(filetmp,i-1);
		  read(filetmp,nilai_mhs);

          write('|',i:2,'|',nilai_mhs.npm:9,'|  ',nilai_mhs.nama:12,'| ',nilai_mhs.kelas:6,'|',nilai_mhs.tgl_lhr:10,'  |');

        writeln;
		end;



	 writeln(garis);
	 writeln('Tekan Enter untuk melihat halaman selanjutnya!!');

	 close(file_nilai);
	 close(filetmp);
     readln;
   end.
