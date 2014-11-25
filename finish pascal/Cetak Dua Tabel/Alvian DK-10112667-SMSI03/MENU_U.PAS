uses crt;
const
garis='--------------------------------------------------';

	type
          nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string[10] ;
          kelas   : string[5];
    end;

var
   file_nilai,FileTmp           	: file of nilai;
   nilai_mhs,temp           : nilai;
   i,j,x,y,jm                  : integer;
   urut : array [1..100] of nilai;
   lagi,ul,pil:char;
   ada:boolean;
   npmcari:string[8];

 Procedure Menu; 
Begin 
	Clrscr; 
	Gotoxy(34,1);Write('MENU PILIHAN'); 
	Gotoxy(34,2);Write('============'); 
	Gotoxy(27,4);Write('1. Input Data Mahasiswa'); 
	Gotoxy(27,5);Write('2. Output Data Mahasiswa'); 
	Gotoxy(27,6);Write('3. Tambah Data Mahasiswa');  
	Gotoxy(27,10);Write('4. Keluar (Exit)'); 
	Gotoxy(32,12);Write('Pilihan [1..4]: ');Pil:=Readkey; 
End;

 procedure input;
 begin
 ul:='Y';
     assign (file_nilai,'D:\mahsi.dat');
           rewrite(file_nilai);
           i:=0;
           repeat
               i:=i+1;
              clrscr;
              writeln('Mengisi data pada File Mhs.dat');
              writeln;
              writeln('Mengisi data ke ',i);
              writeln;
              with nilai_mhs do
              begin
                write('NPM           : ');readln(npm);
                write('Nama          : ');readln(nama);
                write('Kelas         : ');readln(kelas);
				write('Tgl. Lahir    : ');readln(tgl_lhr);
              end;
              write(file_nilai,nilai_mhs);
              writeln;
              write('Isi lagi?(y/t) : ');
              lagi:=upcase(readkey);
        until lagi = 'T' ;
        clrscr;
        close(file_nilai);

end;

procedure tambah;

Begin
        ul:='Y';
	Lagi:='Y';
	Clrscr;
	Assign(File_nilai,'D:\mahsi.Dat');
	Reset(File_nilai);
	If IOResult<>0 Then
		Rewrite(file_nilai);

Repeat
		Clrscr;
		Ada:=False;
		i:=0;
		Gotoxy(30,1);Write('TAMBAH DATA MAHASISWA');
		Gotoxy(30,2);Write('=====================');
		Gotoxy(20,4);write('NPM           : ');Readln(npmcari);
	While (Ada=False) And (i<>Filesize(file_nilai)) Do
		Begin
			Seek(file_nilai,i);
			Read(file_nilai,nilai_mhs);
			If nilai_mhs.NPM=npmcari Then
				Ada:=True
			Else
				Inc(i);
		End;

	If (Ada=True) Then
		Begin
		Gotoxy(20,9);Write('NPM  "',npmcari,'"  Ini  Sudah Ada!');
		End
	Else
		Begin
			Seek(file_nilai,Filesize(file_nilai));
			nilai_mhs.npm:=npmcari;
			with nilai_mhs do
              begin

                Gotoxy(20,5);write('Nama          : ');readln(nama);
                Gotoxy(20,6);write('Kelas         : ');readln(kelas);
				Gotoxy(20,7);write('Tgl. Lahir    : ');readln(tgl_lhr);
              end;
			Write(file_nilai,nilai_mhs);
		End;
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
	Close(file_nilai);
End;



procedure output;

begin

ul:='Y';
    assign(file_nilai,'D:\mahsi.dat');    {sorting}
     reset(file_nilai);
     jm:=filesize(file_nilai);
		for x:=1 to filesize(file_nilai) do read(file_nilai,urut[x]);
		close(file_nilai);



	for x:=1 to jm-1 do
		for y:=x to jm do
			if urut[y].nama<urut[x].nama then
				begin
					temp:=urut[x];
					urut[x]:=urut[y];
					urut[y]:=temp;
				end;

	assign(file_nilai,'D:\mahsi.dat');
	rewrite(file_nilai);
	for i:=1 to jm do write(file_nilai,urut[i]);
	close(file_nilai); {sorting}

	 assign(file_nilai,'D:\mahsi.dat'); {output}
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
		if filesize(filetmp)=0 then
     end;
	 		if filesize(filetmp)=0 then
			begin
			writeln('Maaf Halaman 1 masih kosong, harap menginput data kembali!!');
			readln;
			tambah;
			output;
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
	 		if filesize(filetmp)=0 then
			begin
			writeln('Maaf Halaman 2 masih kosong, harap menginput data kembali!!');
			tambah;
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
	 		if filesize(filetmp)=0 then
			begin
			writeln('Maaf Halaman 3 masih kosong, harap menginput data kembali!!');
			tambah;
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
	 		if filesize(filetmp)=0 then
			begin
			writeln('Maaf Halaman 4 masih kosong, harap menginput data kembali!!');
			tambah;
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
     writeln(' ':35,'Halaman 5');
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
			if filesize(filetmp)=0 then
			begin
			writeln('Maaf Halaman 5 masih kosong, harap menginput data kembali!!');
			tambah;
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

   end;
Begin 
	Repeat 
	Menu; 
	Case Pil Of 
		'1' : input; 
		'2' : output; 
		'3' : tambah;   
		End; 
	Until (Ul<>'Y') Or (Pil='4');
End. 
