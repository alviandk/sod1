uses crt;
const
garis='--------------------------------------------';

type
          nilai = record
          nama    : string [25];
          npm     : string [8];
          usia : integer ;

    end;

var
   file_nilai           : file of nilai;
   nilai_mhs,temp            : nilai;
   i,j,jm1,jm2,gran,count,x,y                  : integer;
   urut : array [1..10] of nilai;

begin

    assign(file_nilai,'D:\maha.dat');
     reset(file_nilai);
		for x:=1 to 10 do read(file_nilai,urut[x]);
		close(file_nilai);



	for x:=1 to 9 do
		for y:=x to 10 do
			if urut[y].nama<urut[x].nama then
				begin
					temp:=urut[x];
					urut[x]:=urut[y];
					urut[y]:=temp;
				end;

	assign(file_nilai,'D:\mahau.dat');
	rewrite(file_nilai);
	for i:=1 to 10 do write(file_nilai,urut[i]);
	close(file_nilai);

	 clrscr;
     assign(file_nilai,'D:\mahau.dat');
     reset(file_nilai);
     writeln;

     jm1:=0;
     jm2:=0;
     gran:=0;
     writeln(' ':35,'Halaman 1');
     writeln(garis);
     writeln('|No|       Nama       |     NPM     | Usia |');
     writeln(garis);
     for j:= 1 to 5 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',j:2,'|',nama:18,'|  ',npm:11,'| ',usia:5,'|');
             jm1:=jm1+(usia);
          end;

          writeln;
     end;;


     writeln(garis);
     write('Jumlah     :');
     writeln(jm1);
     writeln(garis);
     writeln;
     writeln(' ':35,'Halaman 2');
     writeln(garis);
     writeln('|No|       Nama       |     NPM     | Usia |');
     writeln(garis);
     for i:= 6 to 10 do
     begin
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
          write('|',i:2,'|',nama:18,'|  ',npm:11,'| ',usia:5,'|');
             jm2:=(jm2+usia);
          end;

          writeln;
     end;
     writeln(garis);
     write('Jumlah     :');
     writeln(jm2);
     writeln(garis);
     gran:=jm1+jm2;
     write('Grand Total :');write(gran);
     close(file_nilai);
     readln;
   end.
