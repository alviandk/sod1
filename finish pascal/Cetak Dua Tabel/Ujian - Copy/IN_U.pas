uses crt;
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
   i,j                  : integer;


begin
     assign (file_nilai,'D:\mahasi.dat');
     rewrite(file_nilai);

     For i:=1 to 20 do
          begin
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
		   writeln;

           write(file_nilai,nilai_mhs);
           readln;
                clrscr;
           end;
     close(file_nilai);
end.