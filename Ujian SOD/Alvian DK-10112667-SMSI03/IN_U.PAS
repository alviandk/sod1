uses crt;
type

    nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string[10] ;
          kelas   : string[5]
    end;

var
   file_nilai,filetmp           : file of nilai;
   nilai_mhs,tmp            : nilai;
   i,j                  : integer;
   lagi:char;


begin
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
              write('Isi lagi?(y/t) : ');readln(lagi);
        until lagi = 't' or 'T' ;
        clrscr;
        close(file_nilai);
end.